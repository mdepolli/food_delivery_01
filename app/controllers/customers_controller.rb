require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def add
    name = @customers_view.ask_for(@customers_view.name_label)
    address = @customers_view.ask_for(@customers_view.address_label)
    customer = Customer.new(name: name, address: address)
    @customer_repository.add(customer)
  end

  def list
    @customers_view.display(@customer_repository.all)
  end
end
