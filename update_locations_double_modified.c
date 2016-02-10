/*    This program generates N random coordinates in space (3D), and N random
    velocity vectors. It then iterates M times to update the locations based
    on the velocity.
    Finally, it outputs the sum of all coordinates as a checksum of the computation.
    Coordinates start in the range [-1000:1000] per dimension.
    Velocities are chosen from the range [-1:1] per dimension.
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <time.h>
#include <math.h>


// Create a list of 'size' floating point numbers in the range [bound]
double* generate_random_list(uint_fast32_t size, uint_fast32_t bound) {
	double *list = malloc(sizeof(double) * (double)size);
	for (uint_fast32_t i=0; i < size; i++) {
		list[i] = (double)rand()/(double)(RAND_MAX/bound);
	}
	return list;
}

// Update location by velocity, one time-step
void update_coords(uint_fast32_t i, double* x, double* y, double* z, double* vx, double* vy, double* vz) {
	x[i] = x[i] + vx[i];
	y[i] = y[i] + vy[i];
	z[i] = z[i] + vz[i];
}

// Sums an array of doubles; needed in replacement of Python sum()
double sum(double* a, uint_fast32_t num_elements)
{
	double sum;
	for (uint_fast32_t i = 0; i < num_elements; i++) {
		sum += a[i];
	}
	return sum;
}

// Main from original file copied to best tested multiple times
double testmain(uint_fast32_t N, uint_fast32_t M) {

	uint_fast32_t object_size = N;
	uint_fast32_t iters = M;

	srand(object_size);

	double* x = generate_random_list(object_size, 1000);
	double* y = generate_random_list(object_size, 1000);
	double* z = generate_random_list(object_size, 1000);
	double* vx = generate_random_list(object_size, 1);
	double* vy = generate_random_list(object_size, 1);
	double* vz = generate_random_list(object_size, 1);

	struct timespec requestStart, requestEnd;
	clock_gettime(CLOCK_MONOTONIC, &requestStart);
	for (uint_fast32_t i=0; i < iters; i++) {
		for (uint_fast32_t j=0; j < object_size; j++) {
			update_coords(j,x,y,z,vx,vy,vz);
		}
	}
	clock_gettime(CLOCK_MONOTONIC, &requestEnd);


	double timeTaken = (requestEnd.tv_sec + (requestEnd.tv_nsec / 1000000000.)) - (requestStart.tv_sec + (requestStart.tv_nsec / 1000000000.));
	free(x);
    	free(y);	
   	free(z);
    	free(vx);
 	free(vy);
 	free(vz);
	return(((1000000. * timeTaken) / (object_size * iters)));

}

// Compares two doubles for qsort()
int compare_double (const void * a, const void * b)
{
  double fa = *(const double*) a;
  double fb = *(const double*) b;
  return (fa > fb) - (fa < fb);
}

// Main:
int main()
{
	uint_fast32_t object_size = (uint_fast32_t) pow((double) 2,8);
	uint_fast32_t iters = (uint_fast32_t) pow((double) 2,16);

	double* output = calloc((double)object_size, sizeof(double));
	for (uint_fast32_t i = 0; i < 17; i++) {
		for (uint_fast32_t j = 0; j < 9; j++) {
			output[j] = testmain(object_size, iters);
		}
		qsort(output, 9, sizeof(double), compare_double);
		printf("%lf \n", output[4]);
		object_size *= 2;
		iters = (uint_fast32_t)(iters / 2);    

	}
	return 0;
}

