require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'airbnb_test')
else
  DatabaseConnection.setup(dbname: 'airbnb')
end
