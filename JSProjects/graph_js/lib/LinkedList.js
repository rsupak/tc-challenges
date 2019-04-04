"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _LinkedListNode = require("./LinkedListNode");

var _LinkedListNode2 = _interopRequireDefault(_LinkedListNode);

var _Comparator = require("./Comparator");

var _Comparator2 = _interopRequireDefault(_Comparator);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var LinkedList = function () {
  function LinkedList(comparatorFunction) {
    _classCallCheck(this, LinkedList);

    this.head = null;
    this.tail = null;
    this.compare = new _Comparator2.default(comparatorFunction);
  }

  _createClass(LinkedList, [{
    key: "prepend",
    value: function prepend(value) {}
  }, {
    key: "append",
    value: function append(value) {}
  }, {
    key: "delete",
    value: function _delete(value) {}
  }, {
    key: "find",
    value: function find(_ref) {
      var _ref$value = _ref.value,
          value = _ref$value === undefined ? undefined : _ref$value,
          _ref$callback = _ref.callback,
          callback = _ref$callback === undefined ? undefined : _ref$callback;
    }
  }, {
    key: "deleteTail",
    value: function deleteTail() {}
  }, {
    key: "deleteHead",
    value: function deleteHead() {}
  }, {
    key: "fromArray",
    value: function fromArray(values) {}
  }, {
    key: "toArray",
    value: function toArray() {}
  }, {
    key: "toString",
    value: function toString(callback) {}
  }, {
    key: "reverse",
    value: function reverse() {}
  }]);

  return LinkedList;
}();

exports.default = LinkedList;