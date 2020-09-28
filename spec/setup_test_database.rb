require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'airbnb_test')

  # Clean the bookmarks table
  connection.exec("TRUNCATE TABLE bookmarks;")
end