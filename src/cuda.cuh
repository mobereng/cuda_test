#pragma once
#include "includes.h"
#include <amgcl/adapter/eigen.hpp>
#include <amgcl/make_solver.hpp>
#include <amgcl/solver/bicgstab.hpp>
#include <amgcl/amg.hpp>
#include <amgcl/coarsening/smoothed_aggregation.hpp>
#include <amgcl/relaxation/spai0.hpp>
#include <amgcl/profiler.hpp>
#include <amgcl/backend/cuda.hpp>
#include <amgcl/relaxation/cusparse_ilu0.hpp>

#ifndef __EIGEN_AMGCL_VECTORS_BACKEND__
#define __EIGEN_AMGCL_VECTORS_BACKEND__
AMGCL_USE_EIGEN_VECTORS_WITH_BUILTIN_BACKEND()
#endif

SparseMatrixXdRowMajor to_rowmajor(
  const SparseMatrixXd & A
);

namespace amg {
  MatrixXd gpu(
    const SparseMatrixXd & A_,
    const MatrixXd & b
  );
}
