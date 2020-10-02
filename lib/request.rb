require './database_connection_setup'
require_relative 'database_connection'

class Request

  attr_reader :id, :date, :guest_id, :space_id, :approved

  def initialize(id, date, guest_id, space_id)
    @id = id
    @date = date
    @guest_id = guest_id
    @space_id = space_id
    @approved = 0
    
  end

  def self.create(date, guest_id, space_id)
    result = DatabaseConnection.query("INSERT INTO bookings (date, guest_id, space_id, approved) VALUES ('#{date}', '#{guest_id}', '#{space_id}', '0') RETURNING id;") #the BIT data type allows us to use 1 for true and 0 for false.
    Request.new(result[0]['id'], date, guest_id, space_id)
  end

  def self.my_requests(user_id)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE guest_id = '#{user_id}'")
    result.map do |request|
      Request.new(request['id'], request['date'], request['guest_id'], request['space_id'])
    end
  end

  def self.my_requests_for(user_id)#SELECT * FROM spaces JOIN bookings ON spaces.id = space_id WHERE userid = 10; SELECT * FROM bookings JOIN spaces ON space_id = spaces.id WHERE spaces.userid =
    result = DatabaseConnection.query("SELECT * FROM spaces JOIN bookings ON spaces.id = space_id WHERE userid = #{user_id}")

    result.map do |request|
      Request.new(request['id'], request['date'], request['guest_id'], request['space_id'])
    end
  end

  def self.get_space(space_id)
    result = DatabaseConnection.query("SELECT userid, name, description, price FROM spaces WHERE id = #{space_id}")
    Space.new(space_id, result[0]['userid'], result[0]['name'], result[0]['description'], result[0]['price'].to_i)
  end

  def self.get_username(user_id)
    result = DatabaseConnection.query("SELECT username FROM users WHERE id = '#{user_id}'")
    result[0]['username']
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE id = #{id}")
    Request.new(id, result[0]['date'], result[0]['guest_id'], result[0]['space_id'])
  end

  def confirmed?
    result = DatabaseConnection.query("SELECT approved FROM bookings WHERE id = #{@id}")
    result[0]['approved'].to_i.zero?
  end


end