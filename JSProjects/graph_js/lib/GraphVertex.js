'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _LinkedList = require('./LinkedList');

var _LinkedList2 = _interopRequireDefault(_LinkedList);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var GraphVertex = function () {
  /**
   * @param {*} value
   */
  function GraphVertex(value) {
    _classCallCheck(this, GraphVertex);

    if (value === undefined) {
      throw new Error('Graph vertex must have a value');
    }

    /**
     * @param {GraphEdge} edgeA
     * @param {GraphEdge} edgeB
     */
    var edgeComparator = function edgeComparator(edgeA, edgeB) {
      if (edgeA.getKey() === edgeB.getKey()) {
        return 0;
      }

      return edgeA.getKey() < edgeB.getKey() ? -1 : 1;
    };

    // Normally you would store string value like vertex name.
    // But generally it may be any object as well
    this.value = value;
    this.edges = new _LinkedList2.default(edgeComparator);
  }

  /**
   * @param {GraphEdge} edge
   * @returns {GraphVertex}
   */


  _createClass(GraphVertex, [{
    key: 'addEdge',
    value: function addEdge(edge) {
      this.edges.append(edge);

      return this;
    }

    /**
     * @param {GraphEdge} edge
     */

  }, {
    key: 'deleteEdge',
    value: function deleteEdge(edge) {
      this.edges.delete(edge);
    }

    /**
     * @returns {GraphVertex[]}
     */

  }, {
    key: 'getNeighbors',
    value: function getNeighbors() {
      var _this = this;

      var edges = this.edges.toArray();

      /** @param {LinkedListNode} node */
      var neighborsConverter = function neighborsConverter(node) {
        return node.value.startVertex === _this ? node.value.endVertex : node.value.startVertex;
      };

      // Return either start or end vertex.
      // For undirected graphs it is possible that current vertex will be the end one.
      return edges.map(neighborsConverter);
    }

    /**
     * @return {GraphEdge[]}
     */

  }, {
    key: 'getEdges',
    value: function getEdges() {
      return this.edges.toArray().map(function (linkedListNode) {
        return linkedListNode.value;
      });
    }

    /**
     * @return {number}
     */

  }, {
    key: 'getDegree',
    value: function getDegree() {
      return this.edges.toArray().length;
    }

    /**
     * @param {GraphEdge} requiredEdge
     * @returns {boolean}
     */

  }, {
    key: 'hasEdge',
    value: function hasEdge(requiredEdge) {
      var edgeNode = this.edges.find({
        callback: function callback(edge) {
          return edge === requiredEdge;
        }
      });

      return !!edgeNode;
    }

    /**
     * @param {GraphVertex} vertex
     * @returns {boolean}
     */

  }, {
    key: 'hasNeighbor',
    value: function hasNeighbor(vertex) {
      var vertexNode = this.edges.find({
        callback: function callback(edge) {
          return edge.startVertex === vertex || edge.endVertex === vertex;
        }
      });

      return !!vertexNode;
    }
  }, {
    key: 'findEdge',
    value: function findEdge(vertex) {
      var edgeFinder = function edgeFinder(edge) {
        return edge.startVertex === vertex || edge.endVertex === vertex;
      };

      var edge = this.edges.find({ callback: edgeFinder });

      return edge ? edge.value : null;
    }
  }, {
    key: 'getKey',
    value: function getKey() {
      return this.value;
    }
  }, {
    key: 'deleteAllEdges',
    value: function deleteAllEdges() {
      var _this2 = this;

      this.getEdges().forEach(function (edge) {
        return _this2.deleteEdge(edge);
      });

      return this;
    }
  }, {
    key: 'toString',
    value: function toString(callback) {
      return callback ? callback(this.value) : '' + this.value;
    }
  }]);

  return GraphVertex;
}();

exports.default = GraphVertex;