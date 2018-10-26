# tcvc-data-structure-challenge
Insertion Sort

### Description

Insertion Sort is an in place sorting algorithm which
starts at first index. It takes one item at a time and compares
it to each item in the array to the left of the item. It then
places that item into the array where it meets the sorting
conditions. A good comparision can be seen when filing papers
alphabetically. Taking one paper at a time, you search the files
until you find the appropriate location, then you place the paper
in its sorted location before you grab the next paper

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
bundle exec rspec
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/onOa52K67ug
