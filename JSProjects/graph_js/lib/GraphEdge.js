"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var GraphEdge = function () {
  /**
   * @param {GraphVertex} startVertex
   * @param {GraphVertex} endVertex
   * @param {number} [weight=1]
   */
  function GraphEdge(startVertex, endVertex) {
    var weight = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 0;

    _classCallCheck(this, GraphEdge);

    this.startVertex = startVertex;
    this.endVertex = endVertex;
    this.weight = weight;
  }

  /**
   * @return {string}
   */


  _createClass(GraphEdge, [{
    key: "getKey",
    value: function getKey() {
      var startVertexKey = this.startVertex.getKey();
      var endVertexKey = this.endVertex.getKey();

      return startVertexKey + "_" + endVertexKey;
    }

    /**
     * @return {GraphEdge}
     */

  }, {
    key: "reverse",
    value: function reverse() {
      var tmp = this.startVertex;
      this.startVertex = this.endVertex;
      this.endVertex = tmp;

      return this;
    }

    /**
     * @return {string}
     */

  }, {
    key: "toString",
    value: function toString() {
      return this.getKey();
    }
  }]);

  return GraphEdge;
}();

exports.default = GraphEdge;