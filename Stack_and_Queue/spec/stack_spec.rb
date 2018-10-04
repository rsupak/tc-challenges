include RSpec

require_relative 'mystack'

RSpec.describe MyStack, type: Class do
  let(:stack) { MyStack.new }

  describe "#push" do
    it "pushes an item on top of the stack" do
      expect(stack.top).to eq nil
      stack.push("Ken")
      expect(stack.top).to eq "Ken"
    end

    it "pushes an item on top of the stack" do
      expect(stack.top).to eq nil
      stack.push("Ken")
      expect(stack.top).to eq "Ken"
      stack.push("Sam")
      expect(stack.top).to eq "Sam"
    end
  end

  describe "#pop" do
    it "pops an item off the top of the stack and returns it" do
      stack.push("Sam")
      stack.push("Ken")
      expect(stack.top).to eq "Ken"
      item = stack.pop
      expect(item).to eq "Ken"
      expect(stack.top).to eq "Sam"
      item = stack.pop
      expect(item).to eq "Sam"
      expect(stack.top).to eq nil
    end
  end

  describe "#empty?" do
    it "returns true when the stack is empty" do
      expect(stack.empty?).to eq true
    end

    it "returns false when the stack is not empty" do
      stack.push("Ken")
      expect(stack.empty?).to eq false
    end
  end
end
