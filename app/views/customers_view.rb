require_relative 'base_view'

class CustomersView < BaseView
  attr_reader :name_label, :address_label

  def initialize
    @name_label = "Enter customer name"
    @address_label = "Enter customer address"
  end

  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}, #{customer.address}"
    end
  end
end
