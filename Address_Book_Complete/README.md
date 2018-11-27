# tcvc-data-structure-challenge
Command Line Address Book

### Description
A simple address book program, allows user to store name, address, phone #s
and access that data at the command line using a Menu System.


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
All supplemental files must be placed in the spec directory.
The methods currently built to import CSVs look for all files in the spec
directory, so any additional CSV files should also be placed in the spec directory.

*** To run MenuController.rb ***
The nature of requiring user input for the menu screen interferes with
the methods used by RSpec to test for values. So in order to use the
UI, follow the instructions below. 

1. Remove the comment '#' from lines 50 & 51 to run the program

2. Comment out lines 50 & 51 to run the test files

# Link to Demo Videos
Demo Video Links
https://youtu.be/q0ueat9x_bY
