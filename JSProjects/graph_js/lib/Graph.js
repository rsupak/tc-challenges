"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Graph = function () {
  function Graph() {
    var isDirected = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;

    _classCallCheck(this, Graph);

    this.vertices = {};
    this.edges = {};
    this.isDirected = isDirected;
  }

  _createClass(Graph, [{
    key: "addVertex",
    value: function addVertex(newVertex) {}
  }, {
    key: "getVertexByKey",
    value: function getVertexByKey(vertexKey) {}
  }, {
    key: "getNeighbors",
    value: function getNeighbors(vertex) {}
  }, {
    key: "getAllVertices",
    value: function getAllVertices() {}
  }, {
    key: "getAllEdges",
    value: function getAllEdges() {}
  }, {
    key: "addEdge",
    value: function addEdge(edge) {}
  }, {
    key: "deleteEdge",
    value: function deleteEdge(edge) {}
  }, {
    key: "findEdge",
    value: function findEdge(startVertex, endVertex) {}
  }, {
    key: "getWeight",
    value: function getWeight() {}
  }, {
    key: "reverse",
    value: function reverse() {}
  }, {
    key: "getVerticesIndices",
    value: function getVerticesIndices() {}
  }, {
    key: "getAdjacencyMatrix",
    value: function getAdjacencyMatrix() {}
  }, {
    key: "toString",
    value: function toString() {}
  }]);

  return Graph;
}();

exports.default = Graph;