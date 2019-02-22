# tcvc-data-structure-challenge

Binary Insertion Sort

### Description

Binary insertion sort employs a binary search to determine the correct
location to insert new elements, and therefore performs ⌈log2(n)⌉ comparisons
in the worst case, which is O(n log n). The algorithm as a whole still has a
running time of O(n2) on average because of the series of swaps required for
each insertion. The number of swaps can be reduced by calculating the
position of multiple elements before moving them. For example, if the target
position of two elements is calculated before they are moved into the right
position, the number of swaps can be reduced by about 25% for random data. 

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
ruby lib/binary_insertion_sort.rb
```

## Running Tests
```bash
bundle exec rspec spec/binary_insertion_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/N0b_NaJFGV4
