require './database_connection_setup'
require_relative 'database_connection'


class Space

  attr_reader :username, :userid, :description, :price, :id, :available_dates

  def initialize(id, userid, description, price)
    @id = id
    @userid = userid
    @description = description
    @price = price
    @available_dates = []
  end


  def self.create(userid, description, price)
    result = DatabaseConnection.query("INSERT INTO spaces (userid, description, price) VALUES ('#{userid}', '#{description}', '#{price}') RETURNING id")
    Space.new(result[0]['id'], userid, description, price)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces JOIN users ON userid = users.id ORDER BY spaces.id DESC;") 
    result.map { |space|
    Space.new(space['id'], space['userid'], space['description'], space['price']) } #use gsub to remove {} and then turn back into array with split(","). Write a unit test for .all and get that to work
  end

  def self.find(space_id)
    result = DatabaseConnection.query("SELECT userid, description, price FROM spaces JOIN users ON userid = users.id WHERE spaces.id = #{space_id}")
    Space.new(space_id, result.first['userid'], result.first['description'], result.first['price'])
  end

  def add_date(space_id, date)
    DatabaseConnection.query("INSERT INTO available_dates (space_id, available_date) VALUES ('#{space_id}', '#{date}');")
    @available_dates << date
  end

  def middle_dates(min_date, max_date)
    dates = []
    until Date.parse(min_date) = Date.parse(max_date)
    dates << Date.parse(min_date) 
    min_date += 1
  end


end