# tcvc-data-structure-challenge
Sort Algorithms
1. BubbleSort
2. BucketSort
3. HeapSort

### Description

Bubble sort and Bucket sort Algorithms are used to sort 
comparable items in an array. Bubble sort, "bubbles" the smaller values
"up" or to the left of an array and larger values are "sink" or move
to the right in the array by comparing the two adjacent values and swapping
the values left if smaller and right if larger.

Bucket sort divides the comparables into buckets, sorts each bucket using 
another sorting algorithm to sort the now smaller collections in each bucket, 
then concatenates the buckets into one larger array, sorted.

Heap sort utilizes the max heap data structure to quickly identify the maximum value
in the array in order to place it in the largest available array index, ultimately
ordering the array from smallest to largest. The heap_sort algorithm is a much more 
efficient sorting algorithm than bubblesort and bucketsort.

## Prerequisites
1. Ruby 2.5.x
2. Bundler
3. Rspec

## Local Deployment
```bash
touch Gemfile
```
using your text editor add the following dependencies to the Gemfile

```
  source "https://rubygems.org"

  gem "byebug"
  gem "rspec", "~> 3.2.0"
  gem "pry"
```


## Production Build and Installation
How to build the application for use
```bash
bundle install --binstubs
bin/rspec --init
```

### Manual Deployment Notes
because this particular rspec uses `require_relative` 
all files to be tested should also be in the spec directory

## Running Tests
```bash
bundle exec rspec
```
The above command will run all of the tests in the Rspec
in order to run the tests individually:

BubbleSort :  
```bash 
bundle exec rspec bubble_sort_spec.rb
```
BucketSort :  
```bash
bundle exec rspec bucket_sort_spec.rb
```
HeapSort :
```bash
bundle exec rspec heap_sort_spec.rb
```
## Notes
# Link to Demo Videos
BubbleSort and BucketSort:
https://youtu.be/t-VBe-900eM

HeapSort:
https://youtu.be/eFYcDbdS944
