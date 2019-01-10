# tcvc-data-structure-challenge

Proxmap Sort

### Description

ProxmapSort, or Proxmap sort, is a sorting algorithm that works by
partitioning an array of data items, or keys, into a number of "subarrays"
(termed buckets, in similar sorts). The name is short for computing a
"proximity map," which indicates for each key K the beginning of a subarray
where K will reside in the final sorted order. Keys are placed into each
subarray using insertion sort. If keys are "well distributed" among the
subarrays, sorting occurs in linear time. The computational complexity
estimates involve the number of subarrays and the proximity mapping function,
the "map key," used. It is a form of bucket and radix sort.

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
ruby lib/proxmap_sort.rb
```


## Running Tests

```bash
bundle exec rspec spec/proxmap_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/ToQdzwsqaCI
