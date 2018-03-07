require_relative "base_repository"
require_relative "../models/order"
require_relative "add_method"

class OrderRepository < BaseRepository
  include AddMethod

  attr_accessor :id
  attr_reader :csv_file_path, :meal_repository, :employee_repository, :customer_repository

  def initialize(csv_file_path, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    super(csv_file_path)
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == "true"
    row[:meal] = meal_repository.find(row[:meal_id].to_i)
    row[:employee] = employee_repository.find(row[:employee_id].to_i)
    row[:customer] = customer_repository.find(row[:customer_id].to_i)
    return Order.new(row)
  end

  def undelivered_orders
    @elements.select { |element| element.delivered? == false }
  end

  def find_undelivered_by_employee_id(employee)
    undelivered_orders.select { |element| element.employee.id == employee.id }
  end

  def save_to_csv
    super
  end
end
