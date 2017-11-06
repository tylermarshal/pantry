class Pantry

  attr_reader :stock, :shopping_list

  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
  end

  def stock_check(ingredient)
    stock[ingredient]
  end

  def restock(ingredient, amount)
    stock[ingredient] += amount
  end

  def add_to_shopping_list(recipe)
    @shopping_list = recipe.ingredients.reduce(shopping_list) do |result, (ingredient, amount)|
      result[ingredient] += amount
      result
    end
  end

  def print_shopping_list
    full_list = shopping_list.reduce("") do |result, (ingredient, amount)|
      puts "* #{ingredient}: #{amount}"
      result += "* #{ingredient}: #{amount}\n"
    end
    full_list.chomp
  end


end
