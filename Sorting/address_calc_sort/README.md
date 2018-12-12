# tcvc-data-structure-challenge
Address Calculation Sort

### Description

address_calculation_sort is a sorting method that uses an address table
into which items are placed using a hashing function. The table itself is
can either be an array of arrays or an array of linked lists,very similar
to the buckets in bucket sort, but the numbers passed into the table are
sorted concurrently to being passed into the table rather than after the
buckets have been filled. This is done using an insertion sort during
the insertion into the linked list.

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
bundle exec rspec spec/address_calculation_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/1eo0s3rbWDQ
