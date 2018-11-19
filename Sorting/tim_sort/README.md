# tcvc-data-structure-challenge
TimSort

### Description

Hybrid sort method that takes advantage of the time complexity advantages
inherent in the insertion and merge sort algorithms. For smaller sub-arrays
insertion sort offers the most efficient sorting method, however, once the 
sub-arrays grow larger than 64 items, insertion sort becomes less efficient
than merge sort. At this point merge sort takes over and completes the sort
of the remaining sub-arrays. This efficiency relies on comparable sub-array
sizes. Finally, as the smaller arrays are being structured from the original
array into runs, The algorithm looks for natural ordered runs already present 
in the original array, and builds runs utilizing these natural ordered runs
which will reduce the overall number of calls to the insertion sort method.


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
bundle exec rspec spec/tim_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link

https://youtu.be/fsngWDdklqw
