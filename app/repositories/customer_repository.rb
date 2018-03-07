require_relative "base_repository"
require_relative "../models/customer"
require_relative "add_method"

class CustomerRepository < BaseRepository
  include AddMethod

  def build_element(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end
end
