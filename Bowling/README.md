# tcvc-data-structure-challenge

Bowling Score

### Description
Bowling score scores a round of ten-pin bowling. A point is earned for
each pin knocked down, and registers bonus points for strikes and spares.
Strike earn 10 points, plus the next two rolls, spares earn 10 points, plus
the next roll. A perfect game (all strikes) earns 300 points total. A bowler
may make a third roll in frame 10 if the first roll is a strike or the second
roll is a spare.

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
ruby lib/bowling_score.rb
```


## Running Tests

```bash
bundle exec rspec spec/bowling_score_spec.rb
```

## Notes

I found a bug when scoring the unfinished game terminating in either a spare
or a strike after making them Demo Video. I added 2 additional tests and corrected 
the bug. It will now score a game up to the last spare or strike in the middle of 
a game and return the running score (minus the ten for that round) similar to an 
automated scoring device at a modern bowling alley.

# Link to Demo Videos

Demo Video Link
https://youtu.be/_ywWW5WWqrI
