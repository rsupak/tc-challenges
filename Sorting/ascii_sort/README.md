# tcvc-data-structure-challenge

Ascii Sort

### Description

Ascii_sort sorts each string in the input array by the ascii value of the
first char in each string. it does this by creating a hash of each string
keyed by the ascii values of the first char in the string. Then if there
are multiple strings keyed into the bucket, it keys the sub-array by the
next char in the string until the strings are in sorted order, (each sub
array only contains 1 item. Finally it returns the flattened array.

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
https://youtu.be/FRWmexUT0IE
