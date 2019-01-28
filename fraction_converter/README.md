# tcvc-challenge

Fraction Converter

### Description

Create a function where given a string representing a simple fraction x/y, your function must return a string representing the corresponding mixed fraction in the following format:

[sign]a b/c

where a is integer part and b/c is irreducible proper fraction. There must be exactly one space between a and b/c. Provide [sign] only if negative (and non zero) and only at the beginning of the number (both integer part and fractional part must be provided absolute).

If the x/y equals the integer part, return integer part only. If integer part is zero, return the irreducible proper fraction only. In both of these cases, the resulting string must not contain any spaces.

Division by zero should raise an error (preferably, the standard zero division error of your language).

Requirements:

Create a function mixed_fraction that takes a string as a arguement (string)
Create test file and get them all to pass

## Prerequisites

1. Ruby 2.5.x
2. Bundler
3. Rspec

## Local Deployment

```bash
ruby lib/converter.rb
```

## Production Build and Installation

How to build the application for use

```bash
bundle install
```

### Manual Deployment Notes


## Running Tests

```bash
bundle exec rspec spec/converter_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/87XyeYgbprI
