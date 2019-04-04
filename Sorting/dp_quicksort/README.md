# tcvc-data-structure-challenge

Dual-Pivot Quicksort

### Description
The idea of dual pivot quick sort is to take two pivots, one in the left 
end of the array and the second, in the right end of the array. The left 
pivot must be less than or equal to the right pivot, so we swap them if 
necessary.

Then, we begin partitioning the array into three parts: in the first part, 
all elements will be less than the left pivot, in the second part all
elements will be greater or equal to the left pivot and also will be
less than or equal to the right pivot, and in the third part all
elements will be greater than the right pivot. Then, we shift the two
pivots to their appropriate positions as we see in the below bar, and
after that we begin quicksorting these three parts recursively, using
this method.

## Prerequisites
1. Ruby 2.5.x
2. Bundler
3. Rspec

## Local Deployment
```bash
bundle install
```

## Production Build and Installation

### Manual Deployment Notes

```bash
ruby lib/dual_pivot_quicksort.rb
```

## Running Tests
```bash
bundle exec rspec spec/dual_pivot_quicksort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/wv1alLzv8p4
