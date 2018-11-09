# tcvc-data-structure-challenge
Shell Sort

### Description

Shell sort is a swap sort method similar to insertion sort.
This method compares values that are a separated by a specified
gap in the indices. The gap allows for the comparison
of a smaller number of sub-arrays than insertion sort, and
greatly decreases the overall iterations of each of those sub arrays,
that said, shell sort also runs in O(n^2) time, but should show
an improvement over much larger arrays than insertion sort.

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
bundle exec rspec spec/shell_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/_ppnFlmne5E
