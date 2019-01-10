# tcvc-data-structure-challenge

Ascii Sort

### Description

ASCII_sort is a form of bucket sort that sorts each strings by their ASCII values.
The strings are recursively bucketized when longer than 1 char && the initial buckets
contain more than one value at that bucket index. 


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
ruby lib/ascii_sort.rb
```


## Running Tests

```bash
bundle exec rspec spec/ascii_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/ZbsBy42Yv9U
