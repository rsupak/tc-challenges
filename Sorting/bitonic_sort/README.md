# tcvc-data-structure-challenge

Biotic Sort

### Description
Bitonic Sort is a classic parallel algorithm for sorting.

Bitonic sort does O(n Log 2n) comparisons.
The number of comparisons done by Bitonic sort are more than popular sorting 
algorithms like Merge Sort [ does O(nLogn) comparisons], but Bitonice sort is 
better for parallel implementation because we always compare elements in 
predefined sequence and the sequence of comparison doesn’t depend on data. 
Therefore it is suitable for implementation in hardware and parallel processor 
array.


Bitonic sort is a recursive sorting algorithm that recursively creates
Bitonic sequences until an array is sorted. A bitonic sequence is a sequence
that both increments for 1 part an decrements for the other.
1,2,3,4,6,5,3,1 is an example of a bitonic sequence. Bitonic sorting takes 
advantage of this property of the bitonic split. By repeated applications of 
the bitonic split, a bitonic sequence can be converted to a monotonic sequence 
(i.e., sorted).The sorting method creates a bitonic sequence from a random array,
then recursively builds a bitonic sequence that returns the length of the array 
as the incrementing part and a zero length array as the decrementing part. The 
method also requires that the length of the array be a power of 2. So placeholder 
values (Float::INFINITY) are added to the end of the array until it is the length of
the next highest power of two. Then after the array is sorted, the placeholders 
are popped from the array until the original array length has been attained.

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
  gem "rspec"
  gem "pry"
```

## Production Build and Installation

How to build the application for use

```bash
bundle install --binstubs
bin/rspec --init
```

### Manual Deployment Notes
The following command will run the sorting method from the main
directory.

```bash
ruby lib/bitonic_sort.rb
```


## Running Tests

```bash
bundle exec rspec spec/biotic_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/TFZI4DE3qw8
