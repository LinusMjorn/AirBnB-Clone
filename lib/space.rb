class Space


  attr_reader :username, :description, :price, :id

  def initialize(id, username, description, price)
    @id = id
    @username = username
    @description = description
    @price = price
  end

  def self.create(username, description, price)
    DatabaseConnection.setup(airbnb_test)

    result = DatabaseConnection.query("INSERT INTO spaces (username, description, price) VALUES ('#{username}', '#{description}', '#{price}' RETURNING id;")
    Space.new(result[0]['id'], username, description, price)
  end

  def self.all
  end

end