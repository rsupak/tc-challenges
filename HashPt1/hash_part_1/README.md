# tcvc-data-structure-challenge
# Open Addressing

# To install Rspec

  # create Gemfile in main directory
  $ touch Gemfile
  - using your text editor add the following dependencies to the Gemfile
  - "pry" MUST be added to this Gemfile
  - byebug is used for debugging purposes, but it not a required dependency

```
  source "https://rubygems.org"

  gem "rspec", "~> 3.2.0"
```

  # run the following command in terminal @ main directory
  $ bundle install --binstubs
  $ bin/rspec --init

  # move files to the appropriate locations
  # because this particular rspec uses `require_relative` 
  # all files to be tested should also be in the spec directory
  
  - move all files to the /spec directory

# To run the rspec from the main directory

$ bundle exec rspec spec/open_addressing_spec.rb
