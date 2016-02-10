# 442-HW-1

The update\_locations code, rewritten in C and "Assembly", with performance test outputs and gnuplots.

The purpose of each file is explained and referred to as used in each part. In general, update\_locations\_\* is actual code, with \_modified used for adding code to run multiple tests at different object sizes all in one command. \*\_results are the reports of the modified code files. \*\_out is a general output of code from the specified language. massif files are memory profiler reports for C/ASM. The gnuscripts create the output.png picture plots.

In general, Jeremy wrote the C code and did the memory profiling, and Nathan wrote the Assembly code and did the graph plotting. We shared the work on the Python code/Part 1.


## Part 1

### A

We wanted the total number of coordinates touched to be the same for every tuple "(N, M)" we benchmarked. We chose the total number of coordinates to be the value of the largest object size (2^24) we would consider. We found by analyizing the code the formula for number of coordinates touched is N * M. Thus, as the object size decreases, the number of iterations increases. For example, we ran the object size of 2^8 for 2^16 iterations and the object of 2^24 for 2^0 iterations. As all our results under this method had a mean update time within one hundrith of 0.375 us (compared to the regularly .2 variation we saw in our naive testing) which we assume supports our claim of statistical significance. 

### B

We ran the largest object size (2^24) for one iteration. This took about 46 seconds. We wanted the smaller object sizes to run at least this long as well so each data point got the same amount of computing power. For example, for the object size of 2^8, because it took approximately 6 seconds to run, we took the median of 8 test values. We found that it took till N = 2^20, M = 2^4 before it took us less than 6 test values implying an underlying exponential function. With this method we attempted to gain the most significant data we could possibly achieve within our time constraints (15 minutes of computation per benchmark).

### C 

The graph of the Python performance is found at file name "output.png". The results show that larger object sizes tend to have longer mean input sizes, and with our C implementation in mind, grow at a rate that limits scaling potetional. 


## Part 2

It's extremely shocking to see the performance difference between the C and Python code. When the Python code executed with a sample size of 2^16 over 2^10 iterations, it took approximately .24 microseconds (see python.out) on average per coordinate update. For the C code, it took only about a hundreth of the time to update each coordinate (mean of .0024; see C\_float.out) with the same sample size, but over MORE iterations (2^16)!. Clearly Python is inefficient for large amounts of updates over a large amount of iterations. We performed the same testing we performed with Python but with 9 runs per (N, M) tuple as we were actually able to test the higher object size code. The gnuplot auto set the ticks on the y axis of the graph in such a manner such that the C port code appears to take zero time reflecting the 1/300th run time of the C implementation at points.


## Part 3

After running update\_locations\_float and update\_locations\_double 5 times each, the difference in mean time between the two is significant (albeit not nearly as bad as Python). I ran the five tests in alteration with the other (ie. I ran the double test, then the float test, then the double test, etc.) in case the CPU load was affecting the other case by the previous tests run. The tests were all run with a 2^16 object size over 2^16 iterations. See the C\_float.out and C\_double.out files for outputs for both. Clearly, floats take less time to calculate than doubles (a mean of .0030208 for doubles, whereas floats have a mean of .0023582). Overall per test, there's about a 2-3 second difference on average between the two. Thus, in terms of performance, using doubles should be for precision, and floats should be used for just a slightly better speed when you're dealing with a number that uses less than 32 bits. The file "output2.png" contains a graphed comparision of update\_locations\_float and update\_locations\_double. From our perspective, the 50x efficiency of the update\_locations\_double when compared to the original python file is very noteworthy, especially when you consider the Python is implemented with floats instead of doubles. That is twice the precision at 1/150th the speed!


## Part 4

Our use of SSE instrinsics inline in our C implemetation update\_locations\_asm did not generate better efficiency than the compiler when both were optimized in gcc at -O3. It is notworthy, however, that even with my sloppy first attempt at SSE intrinsics, it was (for the most part) between the update\_locations\_float and update\_locations\_double mean update times and still took around 1/200th the time the Python code did. A graph reflecting this can be found at the filename "output3.png". We began by attempting to use inline assembly with x86 instructions to try to improve the speed of the sum and the update\_coordinate functions. The result was around 1/4th the speed of the Python code. By switching to the SSE instructions, we improved the clarity of our program and the speed drastically. If you check the commits, you can get an idea of how it was implemented. It is our belief that more modern processors than the lab computers, in combination with better use of aligned data, we could beat the compiler. In fact, when looking at all the tests, there were times the asm slightly outperformed the compiler, but when comparing medians it did not. Possibly, use of definitions might allow for ease of use of the intrisinsics and further readablity, enough to consider using them on a project.


## Part 5

### Python

The amount of memory Python has to use is astounding. Due to the sluggishness of memory\_profiler, I couldn't even run more than 1 iteration of an object size of 2^20 (that took ~2-3 minutes alone to complete!). However, the results of just that were incredible: it reported 209.383 MiB were used JUST for update\_coords. Clearly, this is a memory hogger.

### C

C performs much, much better than Python did, not only in terms of speed but also in terms of memory size used. I installed Valgrind and used its massif feature for memory profiling. Running the object size of 2^20 over 2^8 iterations not only took just a dozen or so seconds to run, but only used ~25 MB (the float version; doubles obviously doubles that since it goes from 32 -> 32*2 = 64 bit)! See massif.c\_float and massif.c\_double for the results.

### ASM

Our SSE Intrinsic C implementation code seems to be very similar in both speed and amount of memory allocated to the C code (comparing with the float output, not the double). See massif.asm.out for the report. There is a slightly longer delay on the assembly code because it's freeing memory at the end, but otherwise there isn't too much different.

