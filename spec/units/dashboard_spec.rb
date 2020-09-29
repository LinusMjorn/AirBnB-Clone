require 'pg'
require 'dashboard'

describe Dashboard do
describe '.all' do
    it 'shows all spaces' do
        connection = PG.connect(dbname: 'airbnb_test')
        connection.exec("INSERT INTO users (id, username) VALUES ('101', 'poop')")
        connection.exec("INSERT INTO spaces (id, userid, description, price) VALUES ('1', '101', 'shithole', '1')")
        connection.exec("INSERT INTO users (id, username) VALUES ('202', 'pee')")
        connection.exec("INSERT INTO spaces (id, userid, description, price) VALUES ('2', '202', 'pisshole', '2')")
      expect(Dashboard.all[0].description).to eq 'pisshole'
      expect(Dashboard.all[0].price).to eq "2"
      expect(Dashboard.all[0].username).to eq "pee"
      expect(Dashboard.all[1].description).to eq 'shithole'
      expect(Dashboard.all[1].price).to eq "1"
      expect(Dashboard.all[1].username).to eq "poop"
    end
  end
end