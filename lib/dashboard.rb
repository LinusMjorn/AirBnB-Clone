# frozen_string_literal: true

require './database_connection_setup'
require_relative 'database_connection'

class Dashboard
  attr_reader :spaceid, :username, :description, :price

  def initialize(spaceid, username, description, price)
    @spaceid = spaceid
    @username = username
    @description = description
    @price = price
  end

  def self.all
    result = DatabaseConnection.query('SELECT spaces.id, description, price, username FROM spaces JOIN users ON userid = users.id ORDER BY spaces.id DESC;') # join onto users table from username JOIN ON userid = users.id
    result.map do |dashboard|
      Dashboard.new(dashboard['spaces.id'], dashboard['username'], dashboard['description'], dashboard['price'])
    end
  end
end
