require 'pg'
require 'dashboard'

describe Dashboard do
describe '.all' do
    it 'shows all spaces' do
        connection = PG.connect(dbname: 'airbnb_test')
        connection.exec("INSERT INTO users (id, username) VALUES ('101', 'poop')")
        connection.exec("INSERT INTO spaces (id, userid, description, price) VALUES ('1', '101', 'shithole', '1')")
      expect(Dashboard.all[0].description).to eq 'bachelor pad'
      expect(Dashboard.all[1].description).to eq 'seafront room'
    end
  end
end