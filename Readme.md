# GeodockeR-m1

This is an ongoing project to build a docker container for geospatial environments in R for Apple M1 computer. 
[arm64v8/r-base](https://hub.docker.com/r/arm64v8/r-base) is used. 

## how to use

1. build and run this container:

```
docker-compose up -d --build
```

2. with the use of VScode and Docker extension, `Attach Visual Studio Code` by right-clikking this container named `geodocker-m1_r`.


## benchmark test (without parallel)
A benchmarking test without paralleling on a macbook pro with m1max chip, 64GB RAM, the performance of R in this container is close to the one installed on the local machine.  

```
library(benchmarkme)

 res = benchmark_std()
 res
 ```

### 1. performance of local R (version 4.1.2) on m1max 
```
   user system elapsed          test test_group cores
1  0.092  0.002   0.094           fib       prog     0
2  0.092  0.001   0.092           fib       prog     0
3  0.093  0.001   0.095           fib       prog     0
4  0.342  0.026   0.368           gcd       prog     0
5  0.179  0.025   0.204           gcd       prog     0
6  0.176  0.031   0.206           gcd       prog     0
7  0.266  0.009   0.275       hilbert       prog     0
8  0.263  0.010   0.274       hilbert       prog     0
9  0.105  0.008   0.113       hilbert       prog     0
10 0.604  0.003   0.607      toeplitz       prog     0
11 0.601  0.002   0.603      toeplitz       prog     0
12 0.601  0.003   0.604      toeplitz       prog     0
13 0.586  0.045   0.632     escoufier       prog     0
14 0.587  0.034   0.621     escoufier       prog     0
15 0.586  0.031   0.618     escoufier       prog     0
16 0.180  0.011   0.191         manip matrix_cal     0
17 0.333  0.012   0.345         manip matrix_cal     0
18 0.176  0.009   0.186         manip matrix_cal     0
19 0.103  0.002   0.106         power matrix_cal     0
20 0.104  0.003   0.107         power matrix_cal     0
21 0.105  0.002   0.106         power matrix_cal     0
22 0.592  0.006   0.600          sort matrix_cal     0
23 0.593  0.006   0.598          sort matrix_cal     0
24 0.604  0.006   0.610          sort matrix_cal     0
25 9.490  0.051   9.554 cross_product matrix_cal     0
26 9.498  0.047   9.553 cross_product matrix_cal     0
27 9.494  0.045   9.538 cross_product matrix_cal     0
28 0.785  0.005   0.789            lm matrix_cal     0
29 0.791  0.005   0.796            lm matrix_cal     0
30 0.792  0.004   0.796            lm matrix_cal     0
31 5.155  0.033   5.189      cholesky matrix_fun     0
32 5.152  0.035   5.188      cholesky matrix_fun     0
33 5.157  0.026   5.182      cholesky matrix_fun     0
34 1.760  0.010   1.770   determinant matrix_fun     0
35 1.748  0.010   1.759   determinant matrix_fun     0
36 1.749  0.005   1.753   determinant matrix_fun     0
37 0.418  0.001   0.419         eigen matrix_fun     0
38 0.429  0.001   0.429         eigen matrix_fun     0
39 0.437  0.001   0.437         eigen matrix_fun     0
40 0.072  0.001   0.073           fft matrix_fun     0
41 0.073  0.002   0.075           fft matrix_fun     0
42 0.073  0.002   0.074           fft matrix_fun     0
43 1.422  0.005   1.427       inverse matrix_fun     0
44 1.421  0.004   1.425       inverse matrix_fun     0
45 1.424  0.005   1.429       inverse matrix_fun     0
```
### 2. performance of  R (version 4.1.2) in this container on m1max 
```
    user system elapsed          test test_group cores
1   0.071  0.004   0.076           fib       prog     0
2   0.057  0.000   0.058           fib       prog     0
3   0.056  0.000   0.057           fib       prog     0
4   1.496  0.006   1.502           gcd       prog     0
5   1.384  0.000   1.381           gcd       prog     0
6   1.347  0.001   1.348           gcd       prog     0
7   0.203  0.024   0.228       hilbert       prog     0
8   0.193  0.026   0.218       hilbert       prog     0
9   0.136  0.015   0.151       hilbert       prog     0
10  0.717  0.000   0.717      toeplitz       prog     0
11  0.705  0.000   0.705      toeplitz       prog     0
12  0.762  0.000   0.762      toeplitz       prog     0
13 26.324  0.006  26.334     escoufier       prog     0
14 26.371  0.000  26.374     escoufier       prog     0
15 26.203  0.000  26.206     escoufier       prog     0
16  0.299  0.012   0.311         manip matrix_cal     0
17  0.304  0.025   0.330         manip matrix_cal     0
18  0.196  0.029   0.224         manip matrix_cal     0
19  0.143  0.005   0.148         power matrix_cal     0
20  0.137  0.000   0.137         power matrix_cal     0
21  0.136  0.011   0.147         power matrix_cal     0
22  0.595  0.009   0.604          sort matrix_cal     0
23  0.608  0.007   0.616          sort matrix_cal     0
24  0.618  0.005   0.622          sort matrix_cal     0
25  0.426  0.030   0.095 cross_product matrix_cal     0
26  0.431  0.042   0.097 cross_product matrix_cal     0
27  0.409  0.039   0.091 cross_product matrix_cal     0
28  0.050  0.013   0.014            lm matrix_cal     0
29  0.082  0.050   0.032            lm matrix_cal     0
30  0.047  0.002   0.010            lm matrix_cal     0
31  0.466  0.271   0.164      cholesky matrix_fun     0
32  0.282  0.102   0.089      cholesky matrix_fun     0
33  0.292  0.087   0.087      cholesky matrix_fun     0
34  0.319  0.010   0.078   determinant matrix_fun     0
35  0.310  0.009   0.065   determinant matrix_fun     0
36  0.311  0.009   0.066   determinant matrix_fun     0
37  0.497  0.391   0.183         eigen matrix_fun     0
38  0.482  0.367   0.173         eigen matrix_fun     0
39  0.448  0.363   0.166         eigen matrix_fun     0
40  0.121  0.007   0.129           fft matrix_fun     0
41  0.109  0.007   0.117           fft matrix_fun     0
42  0.129  0.002   0.130           fft matrix_fun     0
43  0.346  0.075   0.087       inverse matrix_fun     0
44  0.322  0.076   0.086       inverse matrix_fun     0
45  0.387  0.088   0.102       inverse matrix_fun     0
```


## benchmark test (parallel)
A benchmarking test with paralleling on a macbook pro with m1max chip, 64GB RAM, the performance of R in this container is close to the one installed on the local machine.  

```
bm_parallel("bm_matrix_cal_manip", runs = 3, verbose = TRUE, cores = 4)
    bm = c("bm_matrix_cal_manip","bm_matrix_cal_power", "bm_matrix_cal_sort",
           "bm_matrix_cal_cross_product", "bm_matrix_cal_lm")
results = lapply(bm, bm_parallel,
                    runs = 5, verbose = TRUE, cores = 4L)
results
 ```

### 1. performance of local R (version 4.1.2) on m1max 
```
[[1]]
   user system elapsed  test test_group cores
2 0.003  0.001   0.586 manip matrix_cal     4
3 0.003  0.001   0.446 manip matrix_cal     4
4 0.003  0.001   0.440 manip matrix_cal     4
5 0.003  0.001   0.435 manip matrix_cal     4
6 0.003  0.001   0.431 manip matrix_cal     4

[[2]]
   user system elapsed  test test_group cores
2 0.004  0.001   0.635 power matrix_cal     4
3 0.003  0.002   0.528 power matrix_cal     4
4 0.002  0.001   0.474 power matrix_cal     4
5 0.003  0.001   0.465 power matrix_cal     4
6 0.003  0.001   0.467 power matrix_cal     4

[[3]]
   user system elapsed test test_group cores
2 0.005  0.003   1.300 sort matrix_cal     4
3 0.004  0.002   1.145 sort matrix_cal     4
4 0.004  0.002   1.149 sort matrix_cal     4
5 0.004  0.002   1.147 sort matrix_cal     4
6 0.004  0.002   1.146 sort matrix_cal     4

[[4]]
   user system elapsed          test test_group cores
2 0.019  0.021  12.858 cross_product matrix_cal     4
3 0.019  0.021  12.766 cross_product matrix_cal     4
4 0.019  0.020  12.868 cross_product matrix_cal     4
5 0.020  0.020  12.811 cross_product matrix_cal     4
6 0.020  0.021  12.823 cross_product matrix_cal     4

[[5]]
   user system elapsed test test_group cores
2 0.005  0.003   1.276   lm matrix_cal     4
3 0.004  0.003   1.249   lm matrix_cal     4
4 0.004  0.002   1.281   lm matrix_cal     4
5 0.004  0.002   1.246   lm matrix_cal     4
6 0.004  0.002   1.247   lm matrix_cal     4
```
### 2. performance of  R (version 4.1.2) in this container on m1max 
```
[[1]]
   user system elapsed  test test_group cores
2 0.002  0.003   0.930 manip matrix_cal     4
3 0.002  0.002   0.731 manip matrix_cal     4
4 0.003  0.000   0.746 manip matrix_cal     4
5 0.003  0.000   0.727 manip matrix_cal     4
6 0.003  0.000   0.715 manip matrix_cal     4

[[2]]
   user system elapsed  test test_group cores
2 0.003      0   0.794 power matrix_cal     4
3 0.004      0   0.690 power matrix_cal     4
4 0.004      0   0.628 power matrix_cal     4
5 0.004      0   0.607 power matrix_cal     4
6 0.004      0   0.623 power matrix_cal     4

[[3]]
   user system elapsed test test_group cores
2 0.003      0   1.596 sort matrix_cal     4
3 0.003      0   1.322 sort matrix_cal     4
4 0.004      0   1.274 sort matrix_cal     4
5 0.003      0   1.280 sort matrix_cal     4
6 0.003      0   1.280 sort matrix_cal     4

[[4]]
   user system elapsed          test test_group cores
2 0.004      0   1.095 cross_product matrix_cal     4
3 0.003      0   0.993 cross_product matrix_cal     4
4 0.004      0   0.997 cross_product matrix_cal     4
5 0.003      0   0.985 cross_product matrix_cal     4
6 0.003      0   0.996 cross_product matrix_cal     4

[[5]]
   user system elapsed test test_group cores
2 0.003      0   0.416   lm matrix_cal     4
3 0.003      0   0.474   lm matrix_cal     4
4 0.003      0   0.412   lm matrix_cal     4
5 0.003      0   0.473   lm matrix_cal     4
6 0.003      0   0.414   lm matrix_cal     4
```