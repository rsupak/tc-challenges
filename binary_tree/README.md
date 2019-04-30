# tcvc-data-structure-challenge

Am I a binary tree?

### Description

Am I a binary tree?

A binary search tree is a binary tree that is ordered. This means that if you were to convert the tree to an array using an in-order traversal, the array would be in sorted order. The benefit gained by this ordering is that when the tree is balanced, searching is a logarithmic time operation, since each node you look at that isn't the one you're searching for lets you discard half of the tree.

In this challenge, you will write a function that will validate that a given binary tree is a binary search tree. The sort order is not predefined so it should work with either.

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
ruby lib/is_bst.rb
```


## Running Tests

```bash
bundle exec rspec spec/is_bst_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/fSQvYFq2H7w
