require 'pg'
require './database_connection_setup'

def persisted_data(table, id)
    DatabaseConnection.query("SELECT username, email, id FROM #{table} WHERE id = #{id};")
end

def truncates
  DatabaseConnection.query("TRUNCATE users")
end