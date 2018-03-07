class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @id = attributes[:id]
  end

  def self.headers
    %w[id username password role]
  end

  def row_for_csv
    [id, username, password, role]
  end

  def manager?
    role == "manager"
  end

  def delivery_guy?
    role == "delivery_guy"
  end
end
