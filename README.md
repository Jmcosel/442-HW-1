# 442-HW-1

The update_locations code, rewritten in C and Assembly. Also, the Python version with tests added.

## Part 1

### A
We wanted the total number of coordinates touched to be the same for every tuple "(N, M)" we benchmarked. We chose the total number of coordinates to be the value of the largest object size (2^24) we would consider. We found by analyizing the code the formula for number of coordinates touched is N * M. Thus, as the object size decreases, the number of iterations increases. For example, we ran the object size of 2^8 for 2^16 iterations and the object of 2^24 for 2^0 iterations. As all our results under this method had a mean update time within one hundrith of 0.375 us (compared to the regularly .2 variation we saw in our naive testing) which we assume supports our claim of statistical significance. 

### B
We ran the largest object size (2^24) for one iteration. This took about 46 seconds. We wanted the smaller object sizes to run at least this long as well so each data point got the same amount of computing power. For example, for the object size of 2^8, because it took approximately 6 seconds to run, we took the median of 8 test values. We found that it took till N = 2^20, M = 2^4 before it took us less than 6 test values implying an underlying exponential function. With this method we attempted to gain the most significant data we could possibly achieve within our time constraints (15 minutes of computation per benchmark).

## Part 3

After running update_locations_float and update_locations_double 5 times each, the difference in mean time between the two is significant. I ran the five tests in alteration with the other (ie. I ran the double test, then the float test, then the double test, etc.) in case the CPU load was affecting the other case by the previous tests run. The tests were all run with a 2^16 object size over 2^16 iterations. See the float.out and double.out files for outputs for both. Clearly, floats take less time to calculate than doubles (a mean of .0030208 for doubles, whereas floats have a mean of .0023582). Overall per test, there's about a 2-3 second difference on average between the two. Thus, in terms of performance, using doubles should be for precision, and floats should be used for just a slightly better speed when you're dealing with a number that uses less than 32 bits.