# tcvc-data-structure-challenge

Iterative or Recursive 

### Description

Binary search is an efficient algorithm for finding an item from a sorted
list of items. It works by repeatedly dividing in half the portion of the
list that could contain the item, until you've narrowed down the possible
locations to just one. This challenge is testing which is more efficient,
an iterative algorithm or a recursive one.

## Prerequisites

1. Ruby 2.5.x

## Local Deployment

Simply copy the file and run from the command line

## Production Build and Installation

### Manual Deployment Notes

## Running Tests

Each benchmark test is run as the program is run.
```ruby binary_search.rb```

## Notes

I'm using the .bmbm method to create a rehearsal run for
each of the methods benchmarked below. I've also set
a times marker to run each test 'n' number of times
this allows for a more explicit measurement of which method
runs faster, by dramatically increasing the number or test
that can be made with a simple change. The challenge asked for
each test to be run 3 times, but with such small searches,
the time it took either to complete is minimal and may not fully
display how one is more efficent than the other. Below I've
noted a run using 50_000 iterations. As you can see, the total
time for completion for any of the tests is negligible.
After 4 Test sets each running 50_000 tests, there is not
a clear determination of a winner. Each run completed in less than
1/100 of a sec difference between the iterative run and the recursive
run.

# Test Set 1
Rehearsal --------------------------------------------------
10 Iterative     0.002204   0.000002   0.002206 (  0.002209)
10 Recursive     0.002002   0.000001   0.002003 (  0.002002) Winner
100 Iterative    0.002043   0.000003   0.002046 (  0.002051) Winner
100 Recursive    0.002232   0.000030   0.002262 (  0.002283)
1000 Iterative   0.002572   0.000066   0.002638 (  0.002738)
1000 Recursive   0.002459   0.000054   0.002513 (  0.002571) Winner
----------------------------------------- total: 0.013668sec

                     user     system      total        real
10 Iterative     0.002011   0.000008   0.002019 (  0.002022)
10 Recursive     0.001924   0.000001   0.001925 (  0.001924) Winner
100 Iterative    0.002648   0.000005   0.002653 (  0.002661)
100 Recursive    0.002117   0.000031   0.002148 (  0.002242) Winner
1000 Iterative   0.002267   0.000023   0.002290 (  0.002334)
1000 Recursive   0.001984   0.000014   0.001998 (  0.002010) Winner

# Test set 2
Rehearsal --------------------------------------------------
10 Iterative     0.002075   0.000007   0.002082 (  0.002106)
10 Recursive     0.002065   0.000005   0.002070 (  0.002080) Winner
100 Iterative    0.002129   0.000007   0.002136 (  0.002145) Winner
100 Recursive    0.002540   0.000075   0.002615 (  0.002918)
1000 Iterative   0.002464   0.000039   0.002503 (  0.002574)
1000 Recursive   0.002003   0.000001   0.002004 (  0.002007) Winner
----------------------------------------- total: 0.013410sec

                     user     system      total        real
10 Iterative     0.002011   0.000050   0.002061 (  0.002114)
10 Recursive     0.001998   0.000020   0.002018 (  0.002032) Winner
100 Iterative    0.002132   0.000027   0.002159 (  0.002188)
100 Recursive    0.002005   0.000004   0.002009 (  0.002009) Winner
1000 Iterative   0.002399   0.000072   0.002471 (  0.002563) Winner
1000 Recursive   0.002446   0.000026   0.002472 (  0.002614)

# Test Set 3
Rehearsal --------------------------------------------------
10 Iterative     0.002192   0.000012   0.002204 (  0.002229)
10 Recursive     0.001972   0.000002   0.001974 (  0.001975) Winner
100 Iterative    0.002127   0.000001   0.002128 (  0.002146) Winner
100 Recursive    0.002399   0.000029   0.002428 (  0.002478)
1000 Iterative   0.002855   0.000010   0.002865 (  0.002900)
1000 Recursive   0.001994   0.000000   0.001994 (  0.001995) Winner
----------------------------------------- total: 0.013593sec

                     user     system      total        real
10 Iterative     0.001947   0.000004   0.001951 (  0.001947) Winner
10 Recursive     0.002970   0.000098   0.003068 (  0.003161)
100 Iterative    0.002543   0.000061   0.002604 (  0.002701)
100 Recursive    0.001965   0.000002   0.001967 (  0.001965) Winner
1000 Iterative   0.002052   0.000001   0.002053 (  0.002055) Winner
1000 Recursive   0.002151   0.000009   0.002160 (  0.002263)

# Test Set 4
Rehearsal --------------------------------------------------
10 Iterative     0.002095   0.000009   0.002104 (  0.002111)
10 Recursive     0.001985   0.000001   0.001986 (  0.001985) Winner
100 Iterative    0.002209   0.000007   0.002216 (  0.002231) Winner
100 Recursive    0.002611   0.000047   0.002658 (  0.002702)
1000 Iterative   0.002175   0.000036   0.002211 (  0.002277)
1000 Recursive   0.002085   0.000006   0.002091 (  0.002100) Winner
----------------------------------------- total: 0.013266sec

                     user     system      total        real
10 Iterative     0.002060   0.000002   0.002062 (  0.002066) Winner
10 Recursive     0.002124   0.000037   0.002161 (  0.002184)
100 Iterative    0.002156   0.000043   0.002199 (  0.002335)
100 Recursive    0.002031   0.000008   0.002039 (  0.002053) Winner
1000 Iterative   0.002091   0.000052   0.002143 (  0.002155) Winner
1000 Recursive   0.002681   0.000048   0.002729 (  0.002777)

# Link to Demo Videos

