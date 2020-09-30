# frozen_string_literal: true

require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('airbnb_test')
else
  DatabaseConnection.setup('airbnb')
end
