include RSpec

require_relative 'myqueue'

RSpec.describe MyQueue, type: Class do
  let(:q) { MyQueue.new }

  describe "#enqueue" do
    it "adds an item to the end the queue" do
      q.enqueue("Ken")
      expect(q.head).to eq "Ken"
      expect(q.tail).to eq "Ken"
      q.enqueue("Sam")
      expect(q.head).to eq "Ken"
      expect(q.tail).to eq "Sam"
    end
  end

  describe "#dequeue" do
    it "removes an item from the front of the queue" do
      q.enqueue("Ken")
      expect(q.empty?).to eq false
      q.dequeue
      expect(q.empty?).to eq true
    end

    it "updates the head and tail accessors properly" do
      q.enqueue("Ken")
      expect(q.head).to eq "Ken"
      expect(q.tail).to eq "Ken"
      q.enqueue("Sam")
      expect(q.head).to eq "Ken"
      expect(q.tail).to eq "Sam"
    end
  end

  describe "#empty?" do
    it "returns true if the queue is emtpy" do
      expect(q.empty?).to eq true
    end

    it "returns false if the queue is not empty" do
      q.enqueue("Ken")
      expect(q.empty?).to eq false
    end
  end
end
