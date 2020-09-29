require_relative 'database_connection'
require './database_connection_setup'

class Space

  attr_reader :userid, :description, :price, :id

  def initialize(id, userid, description, price)
    @id = id
    @userid = userid
    @description = description
    @price = price
  end

  def self.create(userid, description, price)
    result = DatabaseConnection.query("INSERT INTO spaces (userid, description, price) VALUES ('#{userid}', '#{description}', '#{price}') RETURNING id;")
    Space.new(result[0]['id'], userid, description, price)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces ORDER BY id DESC;") #join onto users table from username JOIN ON userid = users.id
    result.map { |space|
    Space.new(space['id'], space['userid'], space['description'], space['price']) }
  end

end