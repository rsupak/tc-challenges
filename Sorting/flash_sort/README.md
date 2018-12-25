# tcvc-data-structure-challenge

Flashsort

### Description
Flashsort is a distribution sorting algorithm showing linear computational
complexity O(n) for uniformly distributed data sets and relatively little
additional memory requirement. The basic idea behind flashsort is that in a
data set with a known distribution, it is easy to immediately estimate where
an element should be placed after sorting when the range of the set is known.
For example, if given a uniform data set where the minimum is 1 and the maximum
is 100 and 50 is an element of the set, it’s reasonable to guess that 50 would
be near the middle of the set after it is sorted. This approximate location is
called a class.
https://en.wikipedia.org/wiki/Flashsort


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
ruby lib/flash_sort.rb
```


## Running Tests

```bash
bundle exec rspec spec/flash_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/6Zi-qXGiL7Q
