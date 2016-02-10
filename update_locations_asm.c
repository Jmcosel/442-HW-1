/*    This program generates N random coordinates in space (3D), and N random
    velocity vectors. It then iterates M times to update the locations based
    on the velocity.
    Finally, it outputs the sum of all coordinates as a checksum of the computation.
    Coordinates start in the range [-1000:1000] per dimension.
    Velocities are chosen from the range [-1:1] per dimension.
 */

/* the above line was added as http://stackoverflow.com/questions/26769129/trying-to-use-clock-gettime-but-getting-plenty-of-undeclared-errors-from-ti suggested it would fix our library functions importing improperly...
*/ 
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <mmintrin.h>
#include <xmmintrin.h>
#include <emmintrin.h>
#include <time.h>
#include <malloc.h>

// Create a list of 'size' floating point numbers in the range [bound]
float* generate_random_list(uint_fast32_t size, uint_fast32_t bound) {
    float *list = (float*) memalign(16,sizeof(float) * (float)size);
    for (uint_fast32_t i=0; i < size; i++) {
        list[i] = (float)rand()/(float)(RAND_MAX/bound);
    }
    return list;
}

// Update location by velocity, one time-step
void update_coords(uint32_t i, int32_t* x, int32_t* y, int32_t* z, int32_t* vx, int32_t* vy, int32_t* vz) {

        __m128 vec, flo, out;
           

        vec = _mm_set_ss(vx[i]);
        flo = _mm_set_ss(x[i]);
        out = _mm_add_ss(vec, flo);
        _mm_store_ss(&x[i], out);

        vec = _mm_set_ss(vy[i]);
        flo = _mm_set_ss(y[i]);
        out = _mm_add_ss(vec, flo);
        _mm_store_ss(&y[i], out);

        vec = _mm_set_ss(vz[i]);
        flo = _mm_set_ss(z[i]);
        out = _mm_add_ss(vec, flo);
        _mm_store_ss(&z[i], out);
        
        
}

// Sums an array of floats; needed in replacement of Python sum()
int32_t sum(int32_t* a, uint32_t num_elements)
{
    __m128 avec, sumflo, sumout;
    float* sum = _mm_malloc(sizeof(float), sizeof(int16_t));
    sumflo = _mm_set_ss(*sum);

    for (uint_fast32_t i = 0; i < num_elements; i++) {
        avec = _mm_set_ss(a[i]);
        sumout = _mm_add_ss(avec, sumflo);
        _mm_store_ss(sum, sumout);

    }
    return *sum;
}

// Main:
int main(int argc, char* argv[]) {

	if (argc != 3) {
		printf("Required arguments: vector_length(N) and iterations_num(M)\n");
		exit(-1);
	}

	uint32_t object_size = *argv[1];
	uint32_t iters = *argv[2];

	srand(object_size);

	float* x = generate_random_list(object_size, 1000);
    	float* y = generate_random_list(object_size, 1000);
    	float* z = generate_random_list(object_size, 1000);
	float* vx = generate_random_list(object_size, 1);
    	float* vy = generate_random_list(object_size, 1);
    	float* vz = generate_random_list(object_size, 1);

	struct timespec requestStart, requestEnd;
	clock_gettime(CLOCK_MONOTONIC, &requestStart);
	for (uint32_t i=0; i < iters; i++) {
		for (uint32_t j=0; j < object_size; j++) {
			update_coords(j,x,y,z,vx,vy,vz);
		}
	}
	clock_gettime(CLOCK_MONOTONIC, &requestEnd);

	float chksum = sum(x,object_size) + sum(y,object_size) + sum(z,object_size);
	printf("Mean time per coordinate: %f us\n", ((requestEnd.tv_nsec - requestStart.tv_nsec) / (1000. * (object_size * iters))));
	printf("Final checksum is: %f\n", chksum);
	_mm_free(x);
    	_mm_free(y);
    	_mm_free(z);
    	_mm_free(vx);
    	_mm_free(vy);
    	_mm_free(vz);
}
