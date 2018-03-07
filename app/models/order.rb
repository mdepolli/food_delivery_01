class Order
  attr_accessor :id
  attr_reader :delivered, :meal, :employee, :customer

  def initialize(attributes = {})
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
    @id = attributes[:id]
  end

  def self.headers
    %w[id delivered meal_id employee_id customer_id]
  end

  def row_for_csv
    [id, delivered, meal.id, employee.id, customer.id]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
