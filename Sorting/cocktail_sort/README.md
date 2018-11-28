# tcvc-data-structure-challenge
Cocktail Sort

### Description

Cocktail_sort is a bi-directional bubble sort variant.
Like bubble sort, cocktail sort works by iterating through the list,
comparing adjacent elements and swapping them if they’re in the wrong
order. Cocktail sort also shares the same worst case time complexity
as its predecessor, O(n^2). This can be readily seen when the largest
and smallest numbers are grouped together on their unsorted ends of
the array. (i.e. [10,10,10,1,2,3,4,5,6,7,8,9,0,0,0]).

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
bundle exec rspec spec/cocktail_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/6lo4Dbv5Sfs
