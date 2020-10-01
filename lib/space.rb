require './database_connection_setup'
require_relative 'database_connection'


class Space

  attr_reader :username, :description, :price, :id, :available_dates

  def initialize(id, username, description, price, available_dates)
    @id = id
    @username = username
    @description = description
    @price = price
    @available_dates = available_dates
  end


  def self.create(userid, description, price, available_dates)
    result = DatabaseConnection.query("INSERT INTO spaces (userid, description, price, available_dates) VALUES ('#{userid}', '#{description}', '#{price}', '#{available_dates}') RETURNING id;")
    # Space.new(result[0]['spaces.id'], userid, description, price)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces JOIN users ON userid = users.id ORDER BY spaces.id DESC;") 
    result.map { |space|
    Space.new(space['id'], space['username'], space['description'], space['price']) }
  end

end