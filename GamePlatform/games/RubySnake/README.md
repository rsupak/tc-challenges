# tcvc-data-structure-challenge
Snake game

### Description

Snake is an older classic video game. It was first created in late 70s. Later it was brought to PCs. In this game the player controls a snake. The objective is to eat as many apples as possible. Each time the snake eats an apple its body grows. The snake must avoid the walls and its own body.

Requirements:

The "apples" that the snake eats must be in the shape of the initials "TC"

The snake will start with two circles. Please look at the image below for an explanation of what the snake should look like.

Two types of "apples" small and large.

The snake will add two circles when eating the large "TC" initials and one when eating a smaller "TC”.

Let’s keep score by having a counter of how many apples the snake has eaten. Small “TC” is worth 1 point and large is worth 2 points

## Prerequisites
1. Ruby 2.5.x
2. Bundler
3. Homebrew
4. Simple 2D
5. Ruby 2D

## Local Deployment


## Production Build and Installation
If Simple 2D not installed on local machine:

```bash
brew tap simple2d/tap
brew install simple2d
bundle install
```

Else:
```bash
bundle install
``

### Manual Deployment Notes
```bash
ruby game.rb
```

## Running Tests

## Notes

Tested on MacOS with Simple2D installed. If running on Linux Device, install Simple 2D
Run the `simple2d.sh` Bash script. Everything will be explained along the way and you'll 
be prompted before any action is taken. To run the script from the web, paste this snippet 
in your terminal:
```bash
url='https://raw.githubusercontent.com/simple2d/simple2d/master/bin/simple2d.sh'; which curl > /dev/null && cmd='curl -fsSL' || cmd='wget -qO -'; bash <($cmd $url) install
```



# Link to Demo Videos
Demo Video Link
https://youtu.be/bpGFCLo6uko
