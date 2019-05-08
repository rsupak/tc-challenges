class Queue {
  constructor(data) {
    this.queue = [];
  }

  enqueue(data) {
    this.queue.unshift(data);
  }

  dequeue() {
    this.queue.pop();
  }
}

module.exports = Queue;
