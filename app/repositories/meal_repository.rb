require_relative "base_repository"
require_relative "../models/meal"
require_relative "add_method"

class MealRepository < BaseRepository
  include AddMethod

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    return Meal.new(row)
  end
end
