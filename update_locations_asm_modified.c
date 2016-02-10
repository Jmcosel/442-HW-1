/*    This program generates N random coordinates in space (3D), and N random
    velocity vectors. It then iterates M times to update the locations based
    on the velocity.
    Finally, it outputs the sum of all coordinates as a checksum of the computation.
    Coordinates start in the range [-1000:1000] per dimension.
    Velocities are chosen from the range [-1:1] per dimension.
 */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <mmintrin.h>
#include <xmmintrin.h>
#include <emmintrin.h>
#include <time.h>
#include <malloc.h>
#include <math.h>



// Create a list of 'size' floating point numbers in the range [bound]
float* generate_random_list(uint_fast32_t size, uint_fast32_t bound) {
    float *list = (float*) memalign(16,sizeof(float) * (float)size);
    for (uint_fast32_t i=0; i < size; i++) {
        list[i] = (float)rand()/(float)(RAND_MAX/bound);
    }
    return list;
}

// Update location by velocity, one time-step
void update_coords(uint32_t i, float* x, float* y, float* z, float* vx, float* vy, float* vz) {
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
float sum(float* a, uint_fast32_t num_elements)
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

// Main from original file copied to best tested multiple times
float testmain(uint_fast32_t N, uint_fast32_t M) {

    uint_fast32_t object_size = N;
    uint_fast32_t iters = M;
    srand(object_size);

    srand(object_size);

    float* x = generate_random_list(object_size, 1000);
    float* y = generate_random_list(object_size, 1000);
    float* z = generate_random_list(object_size, 1000);
    float* vx = generate_random_list(object_size, 1);
    float* vy = generate_random_list(object_size, 1);
    float* vz = generate_random_list(object_size, 1);
    struct timespec requestStart, requestEnd;
    clock_gettime(CLOCK_MONOTONIC, &requestStart);
    for (uint_fast32_t i=0; i < iters; i++) {
        for (uint_fast32_t j=0; j < object_size; j++) {
            update_coords(j,x,y,z,vx,vy,vz);
        }
    }
    clock_gettime(CLOCK_MONOTONIC, &requestEnd);

    float chksum = (float)sum(x,object_size) + (float)sum(y,object_size) + (float)sum(z,object_size);
    float timeTaken = (requestEnd.tv_sec + (requestEnd.tv_nsec / 1000000000.)) - (requestStart.tv_sec + (requestStart.tv_nsec / 1000000000.));
    _mm_free(x);
    _mm_free(y);
    _mm_free(z);
    _mm_free(vx);
    _mm_free(vy);
    _mm_free(vz);
    return(((1000000. * timeTaken) / (object_size * iters)));

}
// Compares two floats for qsort()
int compare_floats (const void * a, const void * b)
{
  float fa = *(const float*) a;
  float fb = *(const float*) b;
  return (fa > fb) - (fa < fb);
}

// Main:
int main()
{
	uint_fast32_t object_size = (uint_fast32_t) pow((double) 2,8);
	uint_fast32_t iters = (uint_fast32_t) pow((double) 2,16);

	float* output = calloc((float)object_size, sizeof(float));
	for (uint_fast32_t i = 0; i < 17; i++) {
		for (uint_fast32_t j = 0; j < 9; j++) {
			output[j] = testmain(object_size, iters);
		}
		qsort(output, 9, sizeof(float), compare_floats);
		printf("%f \n", output[4]);
		object_size *= 2;
		iters = (uint_fast32_t)(iters / 2);    

	}
	return 0;
}






