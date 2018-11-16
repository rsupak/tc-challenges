# tcvc-data-structure-challenge
How Many Cakes?

### Description
Design a simple method for determinining the number
of cakes that can be baked by comparing a recipe to the
number of ingredients held in a pantry.


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
bundle exec rspec spec/cakes_spec.rb
```
## Notes
All supplemental files must be placed in the spec directory.


# Link to Demo Videos
Demo Video Links
https://youtu.be/pIX9KmaMRHI
