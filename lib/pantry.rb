class Pantry

  attr_reader :stock, :shopping_list, :cookbook

  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook= []
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

  def add_to_cookbook(recipe)
    cookbook << recipe
  end

  def what_can_i_make
    cookbook.map do |recipe|
      make_recipe = true
      if recipe.ingredients.each_pair do |ingredient, amount|
        if stock[ingredient] > amount
          true
  end

  #if stock has an ingredient amount that is
  #greater than the ingredient amount for each recipe


end
