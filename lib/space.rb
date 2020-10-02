require './database_connection_setup'
require_relative 'database_connection'
require 'date'


class Space

  attr_reader :username, :userid, :description, :price, :id
  attr_accessor :available_dates

  def initialize(id, userid, description, price)
    @id = id
    @userid = userid
    @description = description
    @price = price
    @available_dates = get_available_dates(@id)
  end

 


  def self.create(userid, description, price)
    result = DatabaseConnection.query("INSERT INTO spaces (userid, description, price) VALUES ('#{userid}', '#{description}', '#{price}') RETURNING id")
    Space.new(result[0]['id'], userid, description, price)
  end
=begin
  def first_date
    @available_dates.min
  end

  def last_date
    @available_dates.max
  end
=end
  def self.space_available?(space_id, date)
   dates = DatabaseConnection.query("SELECT available_date FROM available_dates WHERE space_id= #{space_id}")
   date_array = dates.map { |date| date['available_date'] }
   p date_array
    date_array.include?(date)

  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;") # JOIN users ON spaces.userid = users.id ORDER BY spaces.id DESC;") 
    result.map { |space|
    Space.new(space['id'], space['userid'], space['description'], space['price']) } #use gsub to remove {} and then turn back into array with split(","). Write a unit test for .all and get that to work

  end

  def self.find(space_id)
    result = DatabaseConnection.query("SELECT userid, description, price FROM spaces JOIN users ON userid = users.id WHERE spaces.id = #{space_id}")

    dates = DatabaseConnection.query("SELECT available_date FROM available_dates WHERE space_id =#{space_id}")
    date_array = dates.map do |date|
       date['available_date']
    end
    Space.new(space_id, result[0]['userid'], result[0]['description'], result[0]['price'].to_i)
  end

  def get_available_dates(space_id)
    dates = DatabaseConnection.query("SELECT available_date FROM available_dates WHERE space_id =#{space_id}")
    date_array = dates.map do |date|
       date['available_date']
    end
  end

  def self.add_dates(space_id, start_date, end_date)
    dates = middle_dates(start_date, end_date)
    dates.each do |date|
      DatabaseConnection.query("INSERT INTO available_dates (space_id, available_date) VALUES ('#{space_id}', '#{date}');")
      #@available_dates << date
    end
  end

  def self.middle_dates(min_date, max_date)
    (Date.parse(min_date)..Date.parse(max_date)).map{ |date| 
    date.strftime}
  end

end