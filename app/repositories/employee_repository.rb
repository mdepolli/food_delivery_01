require_relative "base_repository"
require_relative "../models/employee"

class EmployeeRepository < BaseRepository
  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  def all_delivery_guys
    @elements.select { |element| element.role == "delivery_guy" }
  end
end
