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
    recipe.ingredients.reduce({}) do |result, (ingredient, amount)|
      shopping_list += result[ingredient] =>


end
