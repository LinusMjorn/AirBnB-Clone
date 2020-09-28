require 'pg'
def persisted_data(table, id)
    connection = PG.connect(dbname: 'airbnb_test')
    connection.exec("SELECT username, email, id FROM #{table} WHERE id = #{id};")
end

def truncates
  connection = PG.connect(dbname: 'airbnb_test')
  connection.exec("TRUNCATE users")
end