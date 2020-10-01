require './database_connection_setup'
require_relative 'database_connection'


class Space

  attr_reader :username, :userid, :description, :price, :id, :available_dates

  def initialize(id, userid, description, price, available_dates)
    @id = id
    @userid = userid
    @description = description
    @price = price
    @available_dates = available_dates
  end


  def self.create(userid, description, price, available_dates)
    result = DatabaseConnection.query("INSERT INTO spaces (userid, description, price, available_dates) VALUES ('#{userid}', '#{description}', '#{price}', '{#{available_dates.join(',')}}') RETURNING id, available_dates;")
    Space.new(result[0]['id'], userid, description, price, available_dates)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces JOIN users ON userid = users.id ORDER BY spaces.id DESC;") 
    result.map { |space|
    Space.new(space['id'], space['userid'], space['description'], space['price'], space['available_dates']) } #use gsub to remove {} and then turn back into array with split(","). Write a unit test for .all and get that to work
  end

  def self.find(space_id)
    result = DatabaseConnection.query("SELECT userid, description, price, available_dates FROM spaces JOIN users ON userid = users.id WHERE spaces.id = #{space_id}")
    Space.new(space_id, result.first['userid'], result.first['description'], result.first['price'], result.first['available_dates'])
  end


end