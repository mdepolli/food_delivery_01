require_relative "base_repository"
require_relative "../models/customer"

class CustomerRepository < BaseRepository
  def build_element(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end
end
