# tcvc-data-structure-challenge

Split a Linked List v1.0

### Description

Split a Linked List

Challenge Overview
Linked Lists - Front Back Split

Write a FrontBackSplit() function that takes one list and splits it into two sublists — one for the front half, and one for the back half. If the number of elements is odd, the extra element should go in the front list. For example, FrontBackSplit() on the list 2 -> 3 -> 5 -> 7 -> 11 -> null should yield the two lists 2 -> 3 -> 5 -> null and 7 -> 11 -> null. Getting this right for all the cases is harder than it looks. You will probably need special case code to deal with lists of length < 2 cases.

var source = 1 -> 3 -> 7 -> 8 -> 11 -> 12 -> 14 -> null
var front = new Node()
var back = new Node()
frontBackSplit(source, front, back)
front === 1 -> 3 -> 7 -> 8 -> null
back === 11 -> 12 -> 14 -> null
You should throw an error if any of the arguments to FrontBackSplit are null or if the source list has < 2 nodes.

There is a test file in the code documents. You must get all the tests to pass this challenge. The starter files are written in Javascript. You can pick the language of your choice and place it in the readme file but if you must create a test file in your language with all of the same test cases.

## Prerequisites

1. Ruby 2.5.x
2. Bundler
3. Rspec

## Local Deployment

```bash
bundle install
```

## Production Build and Installation

N/A

### Manual Deployment Notes

```bash
ruby lib/split_linked_list.rb
```


## Running Tests

```bash
bundle exec rspec spec/front_back_split_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/JA6fcUyVn6U
