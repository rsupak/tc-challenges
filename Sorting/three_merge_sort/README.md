# tcvc-data-structure-challenge
Merge Sort

### Description

Merge sort is an incredibly time-efficient sorting method. It takes an
array and breaks it down to individual comparables. Then rebuilds the
array by placing the compared elements into a new array. It does this
dividing the array into halves, recursively until there is only one
element in each sub-array. Then it merges the 2 sub-arrays by comparing
the first elements removing them and placing those elements, sorted, into
a new array. Once those sub-arrays are exhausted, it moves up the
recursion until all elements have been merged into a new sorted array.
A variant of merge sort is called 3-way merge sort where instead of 
splitting the array into 2 parts we split it into 3 parts. Merge sort 
recursively breaks down the arrays to subarrays of size half. Similarly, 
3-way Merge sort breaks down the arrays to subarrays of size one third.

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
ruby lib/three_merge_sort.rb
```

## Running Tests
```bash
bundle exec rspec spec/three_merge_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/K4WcOOLCtMA
