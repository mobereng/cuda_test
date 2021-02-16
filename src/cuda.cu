#include "cuda.cuh"

__global__ void test_kernel(void) {
}

namespace Wrapper {
	void wrapper(void) {
		test_kernel <<<1, 1>>> ();
		printf("Hello World from GPU\n");
	}
}
