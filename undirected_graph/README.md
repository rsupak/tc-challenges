# tcvc-data-structure-challenge
Dijkstra's Graph

### Description
Dijkstra's algorithm is an algorithm for finding the shortest paths between nodes in a graph,
which may represent, for example, road networks. It was conceived by computer scientist
Edsger W. Dijkstra in 1956. For a given source node in the graph, the algorithm finds the shortest
path between that node and every other. It can also be used for finding the shortest paths from a
single node to a single destination node by stopping the algorithm once the shortest path to the
destination node has been determined. For example, if the nodes of the graph represent cities and
edge path costs represent driving distances between pairs of cities connected by a direct road,
Dijkstra's algorithm can be used to find the shortest route between one city and all other cities.

https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm


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
because this particular rspec uses `require_relative` 
all files to be tested should also be in the spec directory

## Running Tests
```bash
bundle exec rspec spec/dijkstra_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/67m8Lswnn9M
