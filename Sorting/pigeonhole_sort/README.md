# tcvc-data-structure-challenge

Pigeonhole Sort

### Description

Pigeonhole sorting is a sorting algorithm that is suitable for sorting lists of elements where the number of elements and the number of possible key values are approximately the same.

It requires O(n + Range) time where n is number of elements in input array and ‘Range’ is number of possible values in array.

Working of Algorithm :

Find minimum and maximum values in array. Let the minimum and maximum values be ‘min’ and ‘max’ respectively. Also find range as ‘max-min-1’.

Set up an array of initially empty “pigeonholes” the same size as of the range.

Visit each element of the array and then put each element in its pigeonhole. An element arr[i] is put in hole at index arr[i] – min.

Start the loop all over the pigeonhole array in order and put the elements from non- empty holes back into the original array.

Comparison with Counting Sort : 
It is similar to counting sort, but differs in that it “moves items twice: once to the bucket array and again to the final destination “.

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

## Running Tests

```bash
bundle exec rspec spec/lib/pigeonhole_sort_spec.rb
```

## Notes

*see `./lib/images/pigeonhole_sort.png` for a visual rundown of the solution

# Link to Demo Videos

Demo Video Link
