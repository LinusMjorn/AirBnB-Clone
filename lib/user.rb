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


end