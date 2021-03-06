require 'pry'

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
    recipes_can_make.map do |recipe|
      recipe.name
    end
  end

  def recipes_can_make
    cookbook.map do |recipe|
      make_recipe = check_each_ingredient(recipe)
      recipe if make_recipe == true
    end.compact
  end

  def check_each_ingredient(recipe)
    make_recipe = true
    recipe.ingredients.each do |ingredient, amount|
      make_recipe = check_if_has_single_ingredient(ingredient, amount)
    end
    make_recipe
  end

  def check_if_has_single_ingredient(ingredient, amount)
    return true if stock[ingredient] > amount
    false
  end

  def how_many_can_i_make
    recipes_can_make.reduce(Hash.new(0)) do |result, recipe|
      result[recipe.name] += amount_per_recipe(recipe)
      result
    end
  end

  def amount_per_recipe(recipe)
    recipe.ingredients.map do |ingredient, amount|
      amount_per_ingredient(ingredient, amount)
    end.min
  end

  def amount_per_ingredient(ingredient, amount)
    ingredient_count = 0
    starting_amount = amount
    until stock[ingredient] < amount
      amount += starting_amount
      ingredient_count += 1
    end
    ingredient_count
  end

end
