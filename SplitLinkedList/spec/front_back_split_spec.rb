require 'node'

RSpec.describe Node, type: Class do
  # test methods
  let(:build_one_two) { build_list_from_array([1,2]) }
  let(:build_one_two_three) { build_list_from_array([1, 2, 3]) }
  let(:build_one_two_three_four_five_six) { build_list_from_array([1, 2, 3, 4, 5, 6]) }

  describe '#tests for front-back splitting of of a linked list' do
    it 'should be able to handle all null arguments' do
      expect { front_back_split(nil, nil, nil)}.to raise_error('throw an error if source, front, and back lists are null')
    end

    it 'should be able to handle cases where one argument is null' do
      expect { front_back_split(nil, Node.new, Node.new)}.to raise_error('error should be thrown if source is null')
      expect { front_back_split(Node.new, nil, Node.new)}.to raise_error('error should be thrown if front is null')
      expect { front_back_split(Node.new, Node.new, nil)}.to raise_error('error should be thrown if back is null')
    end

    it 'should be able to handle a list of length 0 (empty list) or 1' do
      expect { front_back_split(Node.new, Node.new, Node.new)}.to raise_error('error should be thrown if source has an empty node')
      expect { front_back_split(Node.new(1), Node.new, Node.new)}.to raise_error('error should be thrown if source has only one node')
    end

    it 'should be able to handle a list of length 2' do
      front = Node.new
      back = Node.new
      expect(front_back_split(build_one_two, front, back)[0]).to eq('front should be 1 -> null')
      expect(front_back_split(build_one_two, front, back)[1]).to eq('back should be 2 -> null')
    end

    it 'should be able to handle a list of length 3' do
      front = Node.new
      back = Node.new
      expect(front_back_split(build_one_two_three, front, back)[0]).to eq('front should be 1 -> 2 -> null')
      expect(front_back_split(build_one_two_three, front, back)[1]).to eq('back should be 3 -> null')
    end

    it 'should be able to handle a list of length 6' do
      front = Node.new
      back = Node.new
      expect(front_back_split(build_one_two_three_four_five_six, front, back)[0]).to eq('front should be 1 -> 2 -> 3 -> null')
      expect(front_back_split(build_one_two_three_four_five_six, front, back)[1]).to eq('back should be 4 -> 5 -> 6 -> null')
    end

    it 'should be able to handle a list of length 11' do
      source = build_list_from_array([3, 4, 6, 1, 2, 4, 2, 0, 3, 2, 6])
      front = Node.new
      back = Node.new
      expect(front_back_split(source, front, back)[0]).to eq('front should be 3 -> 4 -> 6 -> 1 -> 2 -> 4 -> null')
      expect(front_back_split(source, front, back)[1]).to eq('back should be 2 -> 0 -> 3 -> 2 -> 6 -> null')
    end
    
    it 'should be able to handle a list of length 16' do
      source = build_list_from_array([3, 4, 6, 1, 2, 4, 2, 0, 3, 2, 6, 6, 5, 1, 2, 9])
      front = Node.new
      back = Node.new
      expect(front_back_split(source, front, back)[0]).to eq('front should be 3 -> 4 -> 6 -> 1 -> 2 -> 4 -> 2 -> 0 -> null')
      expect(front_back_split(source, front, back)[1]).to eq('back should be 3 -> 2 -> 6 -> 6 -> 5 -> 1 -> 2 -> 9 -> null')
    end
  end
end
