require './database_connection_setup'
require_relative 'database_connection'


class Dashboard 

    attr_reader :spaceid, :username, :description, :price, :name

    def initialize(spaceid, username, name, description, price)
        @spaceid = spaceid
        @username = username
        @name = name
        @description = description
        @price = price

    end

    def self.all(user_id)
        result = DatabaseConnection.query("SELECT spaces.id, name, description, price, username FROM spaces JOIN users ON userid = users.id WHERE users.id = #{user_id} ORDER BY spaces.id DESC;") #join onto users table from username JOIN ON userid = users.id
        result.map { |dashboard|
        Dashboard.new(dashboard['spaces.id'], dashboard['username'], dashboard['name'], dashboard['description'], dashboard['price']) }
    end

end
