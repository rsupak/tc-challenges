"use strict";

var _Graph = require("../lib/Graph");

var _Graph2 = _interopRequireDefault(_Graph);

var _GraphVertex = require("../lib/GraphVertex");

var _GraphVertex2 = _interopRequireDefault(_GraphVertex);

var _GraphEdge = require("../lib/GraphEdge");

var _GraphEdge2 = _interopRequireDefault(_GraphEdge);

function _interopRequireDefault(obj) {
  return obj && obj.__esModule ? obj : { default: obj };
}

describe("Graph", function() {
  it("should add vertices to graph", function() {
    var graph = new _Graph2.default();

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");

    graph.addVertex(vertexA).addVertex(vertexB);

    expect(graph.toString()).toBe("A,B");
    expect(graph.getVertexByKey(vertexA.getKey())).toEqual(vertexA);
    expect(graph.getVertexByKey(vertexB.getKey())).toEqual(vertexB);
  });

  it("should add edges to undirected graph", function() {
    var graph = new _Graph2.default();

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB);

    graph.addEdge(edgeAB);

    expect(graph.getAllVertices().length).toBe(2);
    expect(graph.getAllVertices()[0]).toEqual(vertexA);
    expect(graph.getAllVertices()[1]).toEqual(vertexB);

    var graphVertexA = graph.getVertexByKey(vertexA.getKey());
    var graphVertexB = graph.getVertexByKey(vertexB.getKey());

    expect(graph.toString()).toBe("A,B");
    expect(graphVertexA).toBeDefined();
    expect(graphVertexB).toBeDefined();

    expect(graph.getVertexByKey("not existing")).toBeUndefined();

    expect(graphVertexA.getNeighbors().length).toBe(1);
    expect(graphVertexA.getNeighbors()[0]).toEqual(vertexB);
    expect(graphVertexA.getNeighbors()[0]).toEqual(graphVertexB);

    expect(graphVertexB.getNeighbors().length).toBe(1);
    expect(graphVertexB.getNeighbors()[0]).toEqual(vertexA);
    expect(graphVertexB.getNeighbors()[0]).toEqual(graphVertexA);
  });

  it("should add edges to directed graph", function() {
    var graph = new _Graph2.default(true);

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB);

    graph.addEdge(edgeAB);

    var graphVertexA = graph.getVertexByKey(vertexA.getKey());
    var graphVertexB = graph.getVertexByKey(vertexB.getKey());

    expect(graph.toString()).toBe("A,B");
    expect(graphVertexA).toBeDefined();
    expect(graphVertexB).toBeDefined();

    expect(graphVertexA.getNeighbors().length).toBe(1);
    expect(graphVertexA.getNeighbors()[0]).toEqual(vertexB);
    expect(graphVertexA.getNeighbors()[0]).toEqual(graphVertexB);

    expect(graphVertexB.getNeighbors().length).toBe(0);
  });

  it("should find edge by vertices in undirected graph", function() {
    var graph = new _Graph2.default();

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB, 10);

    graph.addEdge(edgeAB);

    var graphEdgeAB = graph.findEdge(vertexA, vertexB);
    var graphEdgeBA = graph.findEdge(vertexB, vertexA);
    var graphEdgeAC = graph.findEdge(vertexA, vertexC);
    var graphEdgeCA = graph.findEdge(vertexC, vertexA);

    expect(graphEdgeAC).toBeNull();
    expect(graphEdgeCA).toBeNull();
    expect(graphEdgeAB).toEqual(edgeAB);
    expect(graphEdgeBA).toEqual(edgeAB);
    expect(graphEdgeAB.weight).toBe(10);
  });

  it("should find edge by vertices in directed graph", function() {
    var graph = new _Graph2.default(true);

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB, 10);

    graph.addEdge(edgeAB);

    var graphEdgeAB = graph.findEdge(vertexA, vertexB);
    var graphEdgeBA = graph.findEdge(vertexB, vertexA);
    var graphEdgeAC = graph.findEdge(vertexA, vertexC);
    var graphEdgeCA = graph.findEdge(vertexC, vertexA);

    expect(graphEdgeAC).toBeNull();
    expect(graphEdgeCA).toBeNull();
    expect(graphEdgeBA).toBeNull();
    expect(graphEdgeAB).toEqual(edgeAB);
    expect(graphEdgeAB.weight).toBe(10);
  });

  it("should return vertex neighbors", function() {
    var graph = new _Graph2.default(true);

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB);
    var edgeAC = new _GraphEdge2.default(vertexA, vertexC);

    graph.addEdge(edgeAB).addEdge(edgeAC);

    var neighbors = graph.getNeighbors(vertexA);

    expect(neighbors.length).toBe(2);
    expect(neighbors[0]).toEqual(vertexB);
    expect(neighbors[1]).toEqual(vertexC);
  });

  it("should throw an error when trying to add edge twice", function() {
    function addSameEdgeTwice() {
      var graph = new _Graph2.default(true);

      var vertexA = new _GraphVertex2.default("A");
      var vertexB = new _GraphVertex2.default("B");

      var edgeAB = new _GraphEdge2.default(vertexA, vertexB);

      graph.addEdge(edgeAB).addEdge(edgeAB);
    }

    expect(addSameEdgeTwice).toThrow();
  });

  it("should return the list of all added edges", function() {
    var graph = new _Graph2.default(true);

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB);
    var edgeBC = new _GraphEdge2.default(vertexB, vertexC);

    graph.addEdge(edgeAB).addEdge(edgeBC);

    var edges = graph.getAllEdges();

    expect(edges.length).toBe(2);
    expect(edges[0]).toEqual(edgeAB);
    expect(edges[1]).toEqual(edgeBC);
  });

  it("should calculate total graph weight for default graph", function() {
    var graph = new _Graph2.default();

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");
    var vertexD = new _GraphVertex2.default("D");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB);
    var edgeBC = new _GraphEdge2.default(vertexB, vertexC);
    var edgeCD = new _GraphEdge2.default(vertexC, vertexD);
    var edgeAD = new _GraphEdge2.default(vertexA, vertexD);

    graph
      .addEdge(edgeAB)
      .addEdge(edgeBC)
      .addEdge(edgeCD)
      .addEdge(edgeAD);

    expect(graph.getWeight()).toBe(0);
  });

  it("should calculate total graph weight for weighted graph", function() {
    var graph = new _Graph2.default();

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");
    var vertexD = new _GraphVertex2.default("D");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB, 1);
    var edgeBC = new _GraphEdge2.default(vertexB, vertexC, 2);
    var edgeCD = new _GraphEdge2.default(vertexC, vertexD, 3);
    var edgeAD = new _GraphEdge2.default(vertexA, vertexD, 4);

    graph
      .addEdge(edgeAB)
      .addEdge(edgeBC)
      .addEdge(edgeCD)
      .addEdge(edgeAD);

    expect(graph.getWeight()).toBe(10);
  });

  it("should be possible to delete edges from graph", function() {
    var graph = new _Graph2.default();

    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB);
    var edgeBC = new _GraphEdge2.default(vertexB, vertexC);
    var edgeAC = new _GraphEdge2.default(vertexA, vertexC);

    graph
      .addEdge(edgeAB)
      .addEdge(edgeBC)
      .addEdge(edgeAC);

    expect(graph.getAllEdges().length).toBe(3);

    graph.deleteEdge(edgeAB);

    expect(graph.getAllEdges().length).toBe(2);
    expect(graph.getAllEdges()[0].getKey()).toBe(edgeBC.getKey());
    expect(graph.getAllEdges()[1].getKey()).toBe(edgeAC.getKey());
  });

  it("should should throw an error when trying to delete not existing edge", function() {
    function deleteNotExistingEdge() {
      var graph = new _Graph2.default();

      var vertexA = new _GraphVertex2.default("A");
      var vertexB = new _GraphVertex2.default("B");
      var vertexC = new _GraphVertex2.default("C");

      var edgeAB = new _GraphEdge2.default(vertexA, vertexB);
      var edgeBC = new _GraphEdge2.default(vertexB, vertexC);

      graph.addEdge(edgeAB);
      graph.deleteEdge(edgeBC);
    }

    expect(deleteNotExistingEdge).toThrowError();
  });

  it("should be possible to reverse graph", function() {
    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");
    var vertexD = new _GraphVertex2.default("D");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB);
    var edgeAC = new _GraphEdge2.default(vertexA, vertexC);
    var edgeCD = new _GraphEdge2.default(vertexC, vertexD);

    var graph = new _Graph2.default(true);
    graph
      .addEdge(edgeAB)
      .addEdge(edgeAC)
      .addEdge(edgeCD);

    expect(graph.toString()).toBe("A,B,C,D");
    expect(graph.getAllEdges().length).toBe(3);
    expect(graph.getNeighbors(vertexA).length).toBe(2);
    expect(graph.getNeighbors(vertexA)[0].getKey()).toBe(vertexB.getKey());
    expect(graph.getNeighbors(vertexA)[1].getKey()).toBe(vertexC.getKey());
    expect(graph.getNeighbors(vertexB).length).toBe(0);
    expect(graph.getNeighbors(vertexC).length).toBe(1);
    expect(graph.getNeighbors(vertexC)[0].getKey()).toBe(vertexD.getKey());
    expect(graph.getNeighbors(vertexD).length).toBe(0);

    graph.reverse();

    expect(graph.toString()).toBe("A,B,C,D");
    expect(graph.getAllEdges().length).toBe(3);
    expect(graph.getNeighbors(vertexA).length).toBe(0);
    expect(graph.getNeighbors(vertexB).length).toBe(1);
    expect(graph.getNeighbors(vertexB)[0].getKey()).toBe(vertexA.getKey());
    expect(graph.getNeighbors(vertexC).length).toBe(1);
    expect(graph.getNeighbors(vertexC)[0].getKey()).toBe(vertexA.getKey());
    expect(graph.getNeighbors(vertexD).length).toBe(1);
    expect(graph.getNeighbors(vertexD)[0].getKey()).toBe(vertexC.getKey());
  });

  it("should return vertices indices", function() {
    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");
    var vertexD = new _GraphVertex2.default("D");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB);
    var edgeBC = new _GraphEdge2.default(vertexB, vertexC);
    var edgeCD = new _GraphEdge2.default(vertexC, vertexD);
    var edgeBD = new _GraphEdge2.default(vertexB, vertexD);

    var graph = new _Graph2.default();
    graph
      .addEdge(edgeAB)
      .addEdge(edgeBC)
      .addEdge(edgeCD)
      .addEdge(edgeBD);

    var verticesIndices = graph.getVerticesIndices();
    expect(verticesIndices).toEqual({
      A: 0,
      B: 1,
      C: 2,
      D: 3
    });
  });

  it("should generate adjacency matrix for undirected graph", function() {
    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");
    var vertexD = new _GraphVertex2.default("D");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB);
    var edgeBC = new _GraphEdge2.default(vertexB, vertexC);
    var edgeCD = new _GraphEdge2.default(vertexC, vertexD);
    var edgeBD = new _GraphEdge2.default(vertexB, vertexD);

    var graph = new _Graph2.default();
    graph
      .addEdge(edgeAB)
      .addEdge(edgeBC)
      .addEdge(edgeCD)
      .addEdge(edgeBD);

    var adjacencyMatrix = graph.getAdjacencyMatrix();
    expect(adjacencyMatrix).toEqual([
      [Infinity, 0, Infinity, Infinity],
      [0, Infinity, 0, 0],
      [Infinity, 0, Infinity, 0],
      [Infinity, 0, 0, Infinity]
    ]);
  });

  it("should generate adjacency matrix for directed graph", function() {
    var vertexA = new _GraphVertex2.default("A");
    var vertexB = new _GraphVertex2.default("B");
    var vertexC = new _GraphVertex2.default("C");
    var vertexD = new _GraphVertex2.default("D");

    var edgeAB = new _GraphEdge2.default(vertexA, vertexB, 2);
    var edgeBC = new _GraphEdge2.default(vertexB, vertexC, 1);
    var edgeCD = new _GraphEdge2.default(vertexC, vertexD, 5);
    var edgeBD = new _GraphEdge2.default(vertexB, vertexD, 7);

    var graph = new _Graph2.default(true);
    graph
      .addEdge(edgeAB)
      .addEdge(edgeBC)
      .addEdge(edgeCD)
      .addEdge(edgeBD);

    var adjacencyMatrix = graph.getAdjacencyMatrix();
    expect(adjacencyMatrix).toEqual([
      [Infinity, 2, Infinity, Infinity],
      [Infinity, Infinity, 1, 7],
      [Infinity, Infinity, Infinity, 5],
      [Infinity, Infinity, Infinity, Infinity]
    ]);
  });
});
