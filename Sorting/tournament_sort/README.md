# tcvc-data-structure-challenge

Tournament Sort

### Description

Tournament sort is a sorting algorithm. It improves upon the naive selection
sort by using a priority queue to find the next element in the sort. In the
naive selection sort, it takes O(n) operations to select the next element of
n elements; in a tournament sort, it takes O(log n) operations (after
building the initial tournament in O(n)). Tournament sort is a variation of
heapsort.

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
ruby lib/tournament_sort.rb
```

## Running Tests
```bash
bundle exec rspec spec/tournament_sort_spec.rb
```
## Notes

Currently the sort works for all arrays up to twice the size of the MAX_SIZE for the priority queue.
If the priority queue is too small, the priority queue cannot keep up with sorting the two brackets.
Too many items are placed in the losers bracket causing the method to recurse into stack overflow and/or
the priority queue cannot properly add new items into the queue.

# Link to Demo Videos
Demo Video Link
https://youtu.be/pectDZNIQiM
