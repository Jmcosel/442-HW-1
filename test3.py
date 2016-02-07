
"""
    This program generates N random coordinates in space (3D), and N random
    velocity vectors. It then iterates M times to update the locations based
    on the velocity.
    Finally, it outputs the sum of all coordinates as a checksum of the computation.
    Coordinates start in the range [-1000:1000] per dimension.
    Velocities are chosen from the range [-1:1] per dimension.
"""

import random, sys, timeit, time

###############
# Create a list of 'size' floating point numbers in the range [-bound, bound]
def generate_random_list(size, bound):
    return [random.uniform(-bound, bound) for i in range(size)]

###############
# Update location by velocity, one time-step
def update_coords2(x, y, z, vx, vy, vz):
    for i in range(size):
        x[i] = x[i] + vx[i]
        y[i] = y[i] + vy[i]
        z[i] = z[i] + vz[i]

#############
def test(N, M):

	rt = time.clock()
	size = 2 ** int(N)
	iters = int(M)
	random.seed(size)

	x = generate_random_list(size, 1000.)
	y = generate_random_list(size, 1000.)
	z = generate_random_list(size, 1000.)
	vx = generate_random_list(size, 1.)
	vy = generate_random_list(size, 1.)
	vz = generate_random_list(size, 1.)

	t = timeit.timeit(stmt = "update_coords2(x, y, z, vx, vy, vz)",
                  setup = "from test(N, M) import update_coords2, x, y, z, vx, vy, vz",
                  number = iters)

	chksum = sum(x) + sum(y) + sum(z)
	print("Mean time per coordinate: " + str(1000000 * t / (size * iters)) + "us")
	print("Final checksum is: " + str(chksum))

	rt = time.clock() - rt
	return(rt, 1000000 * t / (size * iters))

def main():
	
	output = []
	for i in range(8, 25):
		mean = 0.
		speed = 0
		N = i	
		M = 1
		while (46. > speed):
			M += 5
			speed, mean = test(N, M)
		output.append([N, M, mean])
		i += 1 
	print(output)
