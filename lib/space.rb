class Space

  attr_reader :username, :description, :price

  def initialize(username, description, price)
    @username = username
    @description = description
    @price = price
  end

  def self.create(username, description, price)
    Space.new(username, description, price)
  end

  def self.all
    




end