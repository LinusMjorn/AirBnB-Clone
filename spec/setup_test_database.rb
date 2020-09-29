require 'pg'
require './lib/database_connection'

def setup_test_database
  DatabaseConnection.setup(dbname: 'airbnb_test')
  # Clear the airbnb table
  connection.exec("TRUNCATE TABLE users;")
  connection.exec("TRUNCATE TABLE spaces;")

end

