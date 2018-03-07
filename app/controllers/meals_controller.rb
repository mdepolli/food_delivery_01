require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def add
    meal_name = @meals_view.ask_for(@meals_view.name_label)
    meal_price = @meals_view.ask_for(@meals_view.price_label).to_i
    meal = Meal.new(name: meal_name, price: meal_price)
    @meal_repository.add(meal)
  end

  def list
    @meals_view.display(@meal_repository.all)
  end
end
