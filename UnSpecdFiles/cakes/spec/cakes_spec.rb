require 'rspec'
require_relative 'cakes'

describe 'cakes' do
  before do
    @pantry1 = Pantry.new(flour: 1200, sugar: 1200, eggs: 5, milk: 200)
    @pantry2 = Pantry.new(sugar: 500, flour: 2000, milk: 2000)
    @pantry3 = Pantry.new(sugar: 300, flour: 2500, chocolate: 300, eggs: 7, milk: 100)

    @recipe1 = Recipe.new(flour: 500, sugar: 200, eggs: 1)
    @recipe2 = Recipe.new(apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100)
    @recipe3 = Recipe.new(chocolate: 200, milk: 100, eggs: 2, flour: 300, sugar: 400)
  end

  # test if method returns number of cakes baked
  it 'returns maximum number of cakes using items in pantry' do
    expect(cakes(@recipe1, @pantry1)).to eq(2)
  end

  # test how method handles items not in pantry
  it 'handles missing items' do
    expect(cakes(@recipe2, @pantry2)).to eq(0)
  end

  # test how method handles not enough items in pantry'
  it 'handles insufficient items in pantry' do
    expect(cakes(@recipe3, @pantry3)).to eq(0)
  end
end
