#
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

  def add_item(item, amount)
    if pantry.include?(item)
      inventory[item] += amount
    else
      inventory[item] = amount
    end
  end
end

def cakes(pantry, recipe)
  missing = []
  found = []
  recipe.each do |k, v|
    if pantry.include?(k)
      pantry.inventory[k] / v > 0 ? found << pantry.inventory[k] / v : 0
    else
      missing << k
    end
  end
  return found.min if missing.empty?

  missing.each { |item| puts "#{item} missing from pantry!" }
end

pantry = Pantry.new({ milk: 3, eggs: 4, butter: 2, flour: 30 })
# pantry.add_item(:milk, 4)
p pantry.include?(:milk)

# recipe1 = { milk: 1, eggs: 2, butter: 1, flour: 15 }
# recipe2 = { milk: 1, eggs: 3, butter: 1, flour: 20 }
# recipe3 = { chocolate: 2, milk: 1, eggs: 2, flour: 10 }

# p cakes(pantry, recipe1)
# pantry = Pantry.new({ milk: 3, eggs: 4, butter: 2, flour: 30 })

# pantry = { milk: 3, eggs: 4, butter: 2, flour: 30 }
# p cakes(pantry, recipe2)
# pantry = { milk: 3, eggs: 4, butter: 2, flour: 30 }
# pantry = Pantry.new({ milk: 3, eggs: 4, butter: 2, flour: 30 })

# cakes(pantry, recipe3)
p pantry.inventory
