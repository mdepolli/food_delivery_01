class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @price = attributes[:price]
    @id = attributes[:id]
  end

  def self.headers
    %w[id name price]
  end

  def row_for_csv
    [id, name, price]
  end
end
