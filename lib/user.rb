require './database_connection_setup'
require_relative 'database_connection'

class User
  attr_reader :email, :username, :id
  def initialize(id, email, username)
    @id = id
    @email = email
    @username = username
  end

  def self.store(password, username, email)
    result =  DatabaseConnection.query("INSERT INTO users (username, password, email) VALUES ('#{username}', crypt('#{password}', gen_salt('bf')), '#{email}') RETURNING id, username, email; ")
    User.new(result[0]['id'], result[0]['email'], result[0]['username'])
  end


  def self.find(username)
    result = DatabaseConnection.query("SELECT username, id, email FROM users WHERE username = '#{username}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['username'])
  end

  def self.authenticate?(username, password)
    result = DatabaseConnection.query("SELECT password FROM users WHERE username = '#{username}' AND password = crypt('#{password}', password)")
      if (result.num_tuples.zero?) 
        false
      else
        !(result[0]['password'] == password)
      end

  end

  def self.duplicated_username?(username)
    result = DatabaseConnection.query("SELECT username FROM users WHERE username = '#{username}'")
    !(result.num_tuples.zero?)
  end

  def self.unique_email?(email)
    result = DatabaseConnection.query("SELECT email FROM users WHERE email = '#{email}'")
    result.num_tuples.zero?
  end

  def self.create(username)
    result = DatabaseConnection.query("SELECT id, email FROM users WHERE username = '#{username}'")
    @current_user = User.new(result[0]['id'], result[0]['email'], username)
  end

  def self.instance
    @current_user
  end

  def self.log_out
    @current_user = nil
  end
end