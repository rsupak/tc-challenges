require_relative '../lib/loop_count'

RSpec.describe '#loop_count' do
  it 'creates a chain' do
    list = LinkedList.new
    list.create_chain_to_test(3, 4)
    expect(list.size).to eq(3)
    expect(list.loop_size).to eq(4)
  end

  it 'creates a chain without a loop' do
    list = LinkedList.new
    list.create_chain_to_test(3, 0)
    expect(list.size).to eq(3)
    expect(list.loop_size).to eq(0)
  end

  it 'creates a chain with loop smaller than the tail' do
    list = LinkedList.new
    list.create_chain_to_test(3, 1)
    expect(list.loop_size).to eq(1)
  end

  it 'creates a loop much larger than the tail' do
    list = LinkedList.new
    list.create_chain_to_test(1, 11)
    expect(list.size).to eq(1)
    expect(list.loop_size).to eq(11)
  end

  it 'create a loop without a tail' do
    list = LinkedList.new
    list.create_chain_to_test(0, 3)
    expect(list.size).to eq(0)
    expect(list.loop_size).to eq(3)
  end
end
