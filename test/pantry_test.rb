require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_pantry_has_stock
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_pantry_can_check_stock_of_item_that_doesnt_exist
    pantry = Pantry.new


    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_pantry_can_check_stock_of_item_thats_in_stock
    pantry = Pantry.new
    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")
  end

  def test_pantry_stock_builds_on_itself
    pantry = Pantry.new
    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")

    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_it_can_add_ingredients_to_the_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")

    assert_equal ({}), r.ingredients

    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), r.ingredients

    pantry.add_to_shopping_list(r)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), pantry.shopping_list
  end

end
