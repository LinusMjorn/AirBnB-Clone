

class User
  attr_reader :email, :username, :id
  def initialize(id, email, username)
    @id = id
    @email = email
    @username = username
  end

  def self.store(password, username, email)
    connection = PG.connect(dbname: 'airbnb_test')
    result =  connection.exec("INSERT INTO users (username, password, email) VALUES ('#{username}', crypt('#{password}', gen_salt('bf')), '#{email}') RETURNING id, username, email; ")
    User.new(result[0]['id'], result[0]['email'], result[0]['username'])
  end


  def self.find(username)
    connection = PG.connect(dbname: 'airbnb_test')
    result = connection.exec("SELECT username, id, email FROM users WHERE username = '#{username}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['username'])
  end

  def self.authenticate?(username, password)
    connection = PG.connect(dbname: 'airbnb_test')
    result = connection.exec("SELECT password FROM users WHERE username = '#{username}' AND password = crypt('#{password}', password)")
    if result.num_tuples.zero?
      false
    else
      !(result[0]['password'] == password)
    end
  end

  def self.duplicated_username?(username)
    connection = PG.connect(dbname: 'airbnb_test')
    result = connection.exec("SELECT username FROM users WHERE username = '#{username}'")
    !(result.num_tuples.zero?)
  end


end