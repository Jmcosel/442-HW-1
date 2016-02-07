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


// Create a list of 'size' floating point numbers in the range [bound]
int_fast32_t* generate_random_list(uint_fast32_t size, uint_fast16_t bound) {
	int_fast32_t *list = malloc(sizeof(int_fast32_t) * (int_fast32_t)bound);
	for (uint_fast32_t i=0; i < size; i++) {
		list[i] = rand();
	}
	return list;
}

// Update location by velocity, one time-step
void update_coords(uint_fast32_t i, int_fast32_t* x, int_fast32_t* y, int_fast32_t* z, int_fast32_t* vx, int_fast32_t* vy, int_fast32_t* vz) {
	x[i] = x[i] + vx[i];
	y[i] = y[i] + vy[i];
	z[i] = z[i] + vz[i];
}

// Sums an array of floats; needed in replacement of Python sum()
int_fast32_t sum(int_fast32_t* a, uint_fast32_t num_elements)
{
	int_fast32_t sum = 0.0;
	for (uint_fast32_t i = 0; i < num_elements; i++) {
		sum = sum + a[i];
	}
	return sum;
}

// Main:
int main(int_fast8_t argc, char* argv[]) {

	if (argc != 3) {
		printf("Required arguments: vector_length(N) and iterations_num(M)\n");
		exit(-1);
	}

	uint_fast32_t object_size = *argv[1];
	uint_fast32_t iters = *argv[2];

	srand(object_size);

	int_fast32_t* x = generate_random_list(object_size, 1000);
	int_fast32_t* y = generate_random_list(object_size, 1000);
	int_fast32_t* z = generate_random_list(object_size, 1000);
	int_fast32_t* vx = generate_random_list(object_size, 1);
	int_fast32_t* vy = generate_random_list(object_size, 1);
	int_fast32_t* vz = generate_random_list(object_size, 1);

	struct timespec requestStart, requestEnd;
	clock_gettime(CLOCK_MONOTONIC, &requestStart);
	for (uint_fast32_t i=0; i < iters; i++) {
		for (uint_fast32_t j=0; j < object_size; j++) {
			update_coords(j,x,y,z,vx,vy,vz);
		}
	}
	clock_gettime(CLOCK_MONOTONIC, &requestEnd);

	int_fast32_t chksum = sum(x,object_size) + sum(y,object_size) + sum(z,object_size);
	printf("Mean time per coordinate: %f us\n", ((requestEnd.tv_nsec - requestStart.tv_nsec) / (1000. * (object_size * iters))));
	printf("Final checksum is: %ld\n", chksum);

}
