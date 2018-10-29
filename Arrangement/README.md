# tcvc-data-structure-challenge
Largest Arrangement

### Description
## Challenge Overview

Create a function that takes a list of one or more non-negative integers, and arranges them such that they form the largest possible number. The answer should return a string.

Examples:

largestArrangement([4, 50, 8, 145]) returns "8504145" (8-50-4-145)

largestArrangement([4, 40, 7]) returns "7440" (7-4-40)

largestArrangement([4, 46, 7]) returns "7464" (7-46-4)

largestArrangement([5, 2, 1, 9, 50, 56]) returns "95655021" (9-56-5-50-21)

largestArrangement([]) returns "Empty Array"

largestArrangement([6]) returns "6"

largestArrangement([2, 3, 1, 9, -50]) returns "Only positive numbers are accepted"

The goal of this challenge is to also learn how to create your own test file. Create the test file using all the test values listed above as examples. Also create the function to solve the goals of creating the largest number possible and handling the edge cases listed above.

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
bundle exec rspec spec/largest_arrangement_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
