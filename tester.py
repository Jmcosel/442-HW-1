#!/usr/bin/env python3
import random, sys, timeit

###############
# Create a list of 'size' floating point numbers in the range [-bound, bound]
def generate_random_list(size, bound):
    return [random.uniform(-bound, bound) for i in range(size)]

###############
# Update location by velocity, one time-step
def update_coords(x, y, z, vx, vy, vz):
    for i in range(size):
        x[i] = x[i] + vx[i]
        y[i] = y[i] + vy[i]
        z[i] = z[i] + vz[i]

############
def testmain(N, M):

	size = 2 ** int(N)
	iters = int(M)

	random.seed(size)

	j = generate_random_list(size, 1000.)
	y = generate_random_list(size, 1000.)
	z = generate_random_list(size, 1000.)
	vx = generate_random_list(size, 1.)
	vy = generate_random_list(size, 1.)
	vz = generate_random_list(size, 1.)

	t = timeit.timeit(stmt = "update_coords(j, y, z, vx, vy, vz)",
        	          setup = "from testmain(N, M) import update_coords, j, y, z, vx, vy, vz",
        	          number = iters)


	return((1000000 * t / (size * iters)))
###############
def medianoffunction(N, M):
	output = []	
	output.append(testmain(N, M))
	output.sort()
	middle = ((M - 1) / 2) + 1
	return (output[middle])
###############
def test():

	output = []
	r = 0.
	for i in range(8, 25):
		N = i	
		M = -1
		while (3.6 > r) or (r > 3.85):
			M += 2
			r = medianoffunction(N, M)			
		output.append([N, M, x])
		i += 1 
	print(output)
############ Main:

test()

exit(0)
