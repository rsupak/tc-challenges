import LinkedListNode from "./LinkedListNode";
import Comparator from "./Comparator";

export default class LinkedList {
  constructor(comparatorFunction) {
    this.head = null;
    this.tail = null;
    this.compare = new Comparator(comparatorFunction);
  }

  prepend(value) {}

  append(value) {
    let node = new LinkedListNode(value);
    if (this.tail == null) {
      this.tail = node;
    } else {
      this.tail.next = node;
    }
    if (this.head == null) this.head = node;
  }

  delete(value) {}

  find({ value = undefined, callback = undefined }) {}

  deleteTail() {}

  deleteHead() {}

  fromArray(values) {}

  toArray() {}

  toString(callback) {}

  reverse() {}
}
