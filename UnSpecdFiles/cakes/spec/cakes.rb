require_relative 'pantry'
require_relative 'recipe'

# cakes method compares recipe to pantry and returns 
# the number of cakes able to be baked using the inventory
# in the pantry.
def cakes(recipe, pantry)
  missing, low = check_inventory(recipe, pantry)
  baked = bake(recipe, pantry) if missing.empty? && low.empty?
  results(baked, missing, low)
end

# compares items in pantry to items in recipe, 
# returns missing or low inventory items
def check_inventory(recipe, pantry)
  missing = []
  low = []
  recipe.ingredients.each do |k, v|
    if pantry.include?(k)
      low << k if pantry.inventory[k] - v < 0
    else
      missing << k
    end
  end
  [missing, low]
end

# returns number of baked cakes
def bake(recipe, pantry)
  baked = []
  recipe.ingredients.each do |k, v|
    baked << pantry.inventory[k] / v
  end
  baked
end

# helper method to return baking results or alerts
def results(baked, missing, low)
  return baked.min if missing.empty? && low.empty?

  return 0 if !missing.empty? || !low.empty?
end
