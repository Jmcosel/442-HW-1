import random, sys, timeit, os

###############
def test():
	output = []
	for i in range(8, 25):
		mean = 0.
		speed = 0
		N = i	
		M = 1
		while (46. > speed):
			M += 5
			strang = 'python3 update_locations.py ' + str(N) + ' ' + str(M)
			output.append(os.system(strang))
		output.append([N, M, mean])
		i += 1 
	print(output)