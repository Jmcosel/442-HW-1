#!/usr/bin/env python3
"""
    This program generates N random coordinates in space (3D), and N random
    velocity vectors. It then iterates M times to update the locations based
    on the velocity.
    Finally, it outputs the sum of all coordinates as a checksum of the computation.
    Coordinates start in the range [-1000:1000] per dimension.
    Velocities are chosen from the range [-1:1] per dimension.
"""

import random, sys, timeit, time, statistics

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
        print(x[i] + y[i] + z[i])

############ Main:

N = 2 ** 8
M = 2 ** 16

for i in range (0, 17):
	rstart = time.clock()
	rend = 0.0 
	numberoftrials = 0
	outputlist = []	
	outputvalue = 0.0
	size = N
	iters = M 
	while (46. > rend):
		size = N
		iters = M
		random.seed(size)
		x = generate_random_list(size, 1000.)
		y = generate_random_list(size, 1000.)
		z = generate_random_list(size, 1000.)
		vx = generate_random_list(size, 1.)
		vy = generate_random_list(size, 1.)
		vz = generate_random_list(size, 1.)

		t = timeit.timeit(stmt = "update_coords(x, y, z, vx, vy, vz)",
        	          	setup = "from __main__ import update_coords, x, y, z, vx, vy, vz",
        	          	number = iters)

		chksum = sum(x) + sum(y) + sum(z)

		rend = time.clock() - rstart 
		numberoftrials += 1
		outputlist.append((1000000 * t / (size * iters))) 	

	outputvalue = statistics.median(outputlist)
	print(N)
	print(M)
	print(numberoftrials)	
	print(outputvalue)
	
	N = N * 2
	M = int(M / 2)
	

exit(0)
