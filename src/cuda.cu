#include "cuda.cuh"


SparseMatrixXdRowMajor to_rowmajor(
  const SparseMatrixXd & A
) {
  SparseMatrixXdRowMajor bridge(A.rows(), A.rows());
  VectorTriplet triplets;
  for (int k = 0; k < A.outerSize(); ++k)
    for (SparseMatrixXd::InnerIterator it(A, k); it; ++it)
      triplets.push_back(TripletDouble((int)it.row(), (int)it.col(), it.value()));
  bridge.setFromTriplets(triplets.begin(), triplets.end());
  return bridge;
}


namespace amg {
  MatrixXd gpu(
    const SparseMatrixXd & A_,
    const MatrixXd & b
  ) {
    typedef amgcl::backend::cuda<double> Backend;
    typedef amgcl::make_solver<
            amgcl::amg<
              Backend,
              amgcl::coarsening::smoothed_aggregation,
              amgcl::relaxation::ilu0
            >,
            amgcl::solver::bicgstab<Backend>
            > Solver;

    // Show the name of the GPU we are using:
    int device;
    cudaDeviceProp prop;
    cudaGetDevice(&device);
    cudaGetDeviceProperties(&prop, device);
    std::cout << prop.name << std::endl;

    // Parse matrix to row major
    SparseMatrixXdRowMajor A = to_rowmajor(A_);

    // Prepare params
    Solver::params solver_params;
    solver_params.solver.tol = 1.e-12;
    Backend::params backend_params;
    cusparseCreate(&backend_params.cusparse_handle);
    Solver solve(A, solver_params, backend_params);

    // Getting solutions
    const double * bx = b.col(0).data();
    const double * by = b.col(1).data();
    const double * bz = b.col(2).data();
    thrust::device_vector<double> dbx(bx, bx + b.rows());
    thrust::device_vector<double> dby(by, by + b.rows());
    thrust::device_vector<double> dbz(bz, bz + b.rows());
    thrust::device_vector<double> dx(A.rows(), 0.0);
    thrust::device_vector<double> dy(A.rows(), 0.0);
    thrust::device_vector<double> dz(A.rows(), 0.0);
    solve(dbx, dx);
    solve(dby, dy);
    solve(dbz, dz);

    // Parsing solution
    //MatrixXd sol(b.rows(), b.cols());
    //sol.col(0) = x;
    //sol.col(1) = y;
    //sol.col(2) = z;
    //return sol;
    return b;
  }
}
