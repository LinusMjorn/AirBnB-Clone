require 'pg'

class DatabaseConnection

    def self.setup(db_name)
       @connection = PG.connect(dbname: db_name)
    end

    def self.connection
        @connection
    end
    
    def self.query_params(sql, params)
        @connection.exec_params(sql, params)
    end

    def self.query(sql)
        @connection.exec(sql)
    end


end