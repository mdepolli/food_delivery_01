require_relative 'base_view'

class OrdersView < BaseView
  def ask_for_meal_id
    ask_for("Enter meal ID").to_i
  end

  def ask_for_employee_id
    ask_for("Enter employee ID").to_i
  end

  def ask_for_customer_id
    ask_for("Enter customer ID").to_i
  end

  def ask_for_order_id
    ask_for("Enter order ID").to_i
  end

  def display(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.delivered}, #{order.meal.name}, #{order.employee.username}, #{order.customer.name}"
    end
  end

  def display_undelivered(orders)
    orders.each do |order|
      puts "#{order.customer.name}.#{order.meal.name}"
    end
  end
end
