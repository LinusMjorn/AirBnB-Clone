require 'space'
require 'user'
require 'database_connection'


describe Space do
  describe '.create' do
    it 'returns the id of a newly created space in the database' do
      seafront_id = Space.create(15, 'seafront room', 400)
      seafront = Space.new(seafront_id, 15,'seafront room', 400)
      expect(seafront).to be_a(Space)
      expect(seafront.description).to eq 'seafront room'
      expect(seafront.username).to eq 15
      expect(seafront.price).to eq 400
    end
  end

  describe '.all' do
    it 'shows all spaces' do
      user = User.store("password","linus","linus@linus.com")
      
      Space.create(user.id, 'seafront room', 400)
      user2 = User.store("password2","linus","linus@linus.com")
      Space.create(user2.id, 'bachelor pad', 50)
      expect(Space.all.first.description).to eq 'bachelor pad'
      expect(Space.all.last.description).to eq 'seafront room'
    end
  end

  describe '.find' do
    it 'finds a space with using the space id' do
      user = User.store("password","linus","linus@linus.com")
      entry = Space.create(user.id, 'seafront room', 400)
      space = Space.new(entry[0]['id'],user.id, 'seafront room', 400)
      expect(Space.find(space.id).id).to eq space.id
   end
 end

end
