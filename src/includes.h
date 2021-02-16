#pragma once

#include <igl/readOBJ.h>
#include <igl/vertex_triangle_adjacency.h>
#include <igl/volume.h>
#include <igl/doublearea.h>
#include <igl/opengl/glfw/Viewer.h>
#include <igl/opengl/glfw/imgui/ImGuiMenu.h>
#include <igl/opengl/glfw/imgui/ImGuiHelpers.h>
#include <imgui/imgui.h>
#include <igl/cotmatrix.h>
#include <igl/edges.h>
#include <igl/edge_lengths.h>
#include <igl/edge_topology.h>
#include <igl/bounding_box_diagonal.h>
#include <igl/euler_characteristic.h>
#include <igl/remove_duplicate_vertices.h>
#include <igl/decimate.h>
#include <igl/is_edge_manifold.h>
#include <igl/jet.h>
#include <igl/grad.h>
#include <igl/principal_curvature.h>
#include <igl/avg_edge_length.h>
#include <igl/cat.h>
#include <igl/barycenter.h>
#include <igl/edge_flaps.h>
#include <iostream>
#include <algorithm>
#include <fstream>
#include <cmath>
#include <tuple>
#include <cstdio>
#include <cctype>
#include <vector>
#include <thread>
#include <ctime>
#include <chrono>
#include <functional>
#include <string>
#include <limits>

using std::cout;
using std::endl;
using std::swap;
using std::max;
using std::string;
using std::thread;
using std::vector;
using std::tuple;
using Eigen::MatrixXd;
using Eigen::MatrixXi;
using Eigen::VectorXd;
using Eigen::VectorXi;
using Eigen::Vector3d;
using Eigen::Vector4f;
using Eigen::SparseMatrix;
using Eigen::Triplet;
using Eigen::RowVector3d;
using Eigen::RowVector4f;
using Eigen::DiagonalMatrix;

typedef tuple<int, int> TuplePairInteger;
typedef tuple<double, double, double> TupleTripletDouble;
typedef vector<double> VectorDouble;
typedef vector<int> VectorInteger;
typedef vector<bool> VectorBoolean;
typedef vector<string> VectorString;
typedef vector<TuplePairInteger> VectorPairInteger;
typedef vector<VectorInteger> MatrixInteger;
typedef vector<VectorDouble> MatrixDouble;
typedef Triplet<double> TripletDouble;
typedef SparseMatrix<double> SparseMatrixXd;
typedef SparseMatrix<double, Eigen::RowMajor> SparseMatrixXdRowMajor;
typedef DiagonalMatrix<double, Eigen::Dynamic> DiagonalMatrixXd;
typedef vector<TripletDouble> VectorTriplet;
