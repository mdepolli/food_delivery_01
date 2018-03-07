require_relative '../views/orders_view'

class OrdersController
  attr_reader :order_repository, :meal_repository, :employee_repository, :customer_repository

  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
  end

  def add
    ask_for_user_data
    get_objects_from_repos
    create_order
  end

  def list
    @orders_view.display(@order_repository.all)
  end

  def list_undelivered_orders
    @orders_view.display(@order_repository.undelivered_orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.find_undelivered_by_employee_id(employee)
    @orders_view.display_undelivered(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.find_undelivered_by_employee_id(employee)
    order_id = @orders_view.ask_for_order_id
    @order_repository.find(order_id).deliver!
    @order_repository.save_to_csv
  end

  private

  def ask_for_user_data
    @meal_id     = @orders_view.ask_for_meal_id
    @employee_id = @orders_view.ask_for_employee_id
    @customer_id = @orders_view.ask_for_customer_id
  end

  def get_objects_from_repos
    @meal     = meal_repository.find(@meal_id)
    @employee = employee_repository.find(@employee_id)
    @customer = customer_repository.find(@customer_id)
  end

  def create_order
    order = Order.new(meal: @meal, employee: @employee, customer: @customer)
    @order_repository.add(order)
  end
end
