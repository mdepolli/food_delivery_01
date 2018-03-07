require_relative 'base_view'

class MealsView < BaseView
  attr_reader :name_label, :price_label

  def initialize
    @name_label = "Enter meal name"
    @price_label = "Enter meal price"
  end

  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name}, #{meal.price}€"
    end
  end
end
