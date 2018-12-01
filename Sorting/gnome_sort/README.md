# tcvc-data-structure-challenge
Gnome Sort

### Description

Gnome Sort also called Stupid sort is based on the concept
of a Garden Gnome sorting his flower pots. A garden gnome
sorts the flower pots by the following method:
He looks at the flower pot next to him and the previous one;
if they are in the right order he steps one pot forward,
otherwise he swaps them and steps one pot backwards.
If there is no previous pot (he is at the starting of the pot line),
he steps forwards; if there is no pot next to him (he is at the end
of the pot line), he is done.
This implementation of gnome sort follows that same idea,
but it also keeps track of the last index accessed before 
starting the swap. Once the swap reaches its final position
the algorithm jumps to the last accessed position in the array
to continue the search.

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
bundle exec rspec spec/gnome_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/BexfEvJx2Bc
