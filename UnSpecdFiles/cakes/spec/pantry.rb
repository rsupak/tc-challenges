# Pantry class hold the current inventory to be used for each recipe.
class Pantry
  attr_accessor :inventory

  def initialize(inventory)
    @inventory = inventory
  end

  def include?(item)
    inventory.key?(item)
  end

  def use(item, amount)
    inventory[item] -= amount
  end
end
