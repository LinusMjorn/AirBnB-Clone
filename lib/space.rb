require './database_connection_setup'
require_relative 'database_connection'


class Space

  attr_reader :username, :description, :price, :id

  def initialize(id, username, description, price)
    @id = id
    @username = username
    @description = description
    @price = price
  end

  def self.create(userid, description, price)
    result = DatabaseConnection.query("INSERT INTO spaces (userid, description, price) VALUES ('#{userid}', '#{description}', '#{price}') RETURNING id;")
    # Space.new(result[0]['spaces.id'], userid, description, price)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces JOIN users ON userid = users.id ORDER BY spaces.id DESC;") 
    result.map { |space|
    Space.new(space['spaces.id'], space['username'], space['description'], space['price']) }
  end

end