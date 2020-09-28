require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'airbnb_test')
  # Clear the bookmarks table
  connection.exec("TRUNCATE TABLE users;")
  connection.exec("TRUNCATE TABLE spaces;")
end