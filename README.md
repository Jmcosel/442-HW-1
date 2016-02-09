# 442-HW-1

The update\_locations code, rewritten in C and Assembly, with performance test outputs and gnuplots.

## Part 1

### A

We wanted the total number of coordinates touched to be the same for every tuple "(N, M)" we benchmarked. We chose the total number of coordinates to be the value of the largest object size (2^24) we would consider. We found by analyizing the code the formula for number of coordinates touched is N * M. Thus, as the object size decreases, the number of iterations increases. For example, we ran the object size of 2^8 for 2^16 iterations and the object of 2^24 for 2^0 iterations. As all our results under this method had a mean update time within one hundrith of 0.375 us (compared to the regularly .2 variation we saw in our naive testing) which we assume supports our claim of statistical significance. 

### B

We ran the largest object size (2^24) for one iteration. This took about 46 seconds. We wanted the smaller object sizes to run at least this long as well so each data point got the same amount of computing power. For example, for the object size of 2^8, because it took approximately 6 seconds to run, we took the median of 8 test values. We found that it took till N = 2^20, M = 2^4 before it took us less than 6 test values implying an underlying exponential function. With this method we attempted to gain the most significant data we could possibly achieve within our time constraints (15 minutes of computation per benchmark).

## Part 2

It's extremely shocking to see the performance difference between the C and Python code. When the Python code executed with a sample size of 2^16 over 2^10 iterations, it took approximately .24 microseconds (see python.out) on average per coordinate update. For the C code, it took only about a hundreth of the time to update each coordinate (mean of .0024; see C\_float.out) with the same sample size, but over MORE iterations (2^16)!. Clearly Python is inefficient for large amounts of updates over a large amount of iterations.

## Part 3

After running update\_locations\_float and update\_locations\_double 5 times each, the difference in mean time between the two is significant (albeit not nearly as bad as Python). I ran the five tests in alteration with the other (ie. I ran the double test, then the float test, then the double test, etc.) in case the CPU load was affecting the other case by the previous tests run. The tests were all run with a 2^16 object size over 2^16 iterations. See the C\_float.out and C\_double.out files for outputs for both. Clearly, floats take less time to calculate than doubles (a mean of .0030208 for doubles, whereas floats have a mean of .0023582). Overall per test, there's about a 2-3 second difference on average between the two. Thus, in terms of performance, using doubles should be for precision, and floats should be used for just a slightly better speed when you're dealing with a number that uses less than 32 bits.

## Part 5

### Python

The amount of memory Python has to use is astounding. Due to the sluggishness of memory\_profiler, I couldn't even run more than 1 iteration of an object size of 2^20 (that took ~2-3 minutes alone to complete!). However, the results of just that were incredible: it reported 209.383 MiB were used JUST for update\_coords. Clearly, this is a memory hogger.

### C

C performs much, much better than Python did, not only in terms of speed but also in terms of memory size used. I installed Valgrind and used its massif feature for memory profiling. Running the object size of 2^20 over 2^8 iterations not only took just a dozen or so seconds to run, but only used ~25 MB (the float version; doubles obviously doubles that since it goes from 32 -> 32*2 = 64 bit)! See massif.c\_float and massif.c\_double for the results.