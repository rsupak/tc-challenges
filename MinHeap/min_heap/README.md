# tcvc-data-structure-challenge
Min-Heap Binary Tree

### Description

## Prerequisites
1. Ruby 2.5.x
  1. Bundler
1. Rspec

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
```
bundle exec rspec
```

## Notes
# Link to Demo Video
https://youtu.be/TysL0YcfhBU
