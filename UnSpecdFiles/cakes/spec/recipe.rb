# Recipe class holds the ingredients needed for each cake.
class Recipe
  attr_reader :ingredients

  def initialize(ingredients)
    @ingredients = ingredients
  end
end
