require 'space'
require 'user'


describe Space do
  describe '.create' do
    it 'creates a new listing' do
      seafront = Space.create(15,'seafront cottages', 'seafront room', 400)
      expect(seafront).to be_a(Space)
      expect(seafront.description).to eq 'seafront room'
      expect(seafront.userid).to eq 15
      expect(seafront.price).to eq 400
    end
  end

  describe '.all' do
    it 'shows all spaces' do
      linus = User.store("password2","linus","linus@linus.com")
      johnny = User.store("password2","johnny","linus@linus.com")
      Space.create(linus.id, 'seafront cottages', 'seafront room', 400)
      Space.create(johnny.id, 'a house', 'bachelor pad', 50)
      expect(Space.all[0].description).to eq 'seafront room'
      expect(Space.all[1].description).to eq 'bachelor pad'
    end
  end

  describe '.find' do
    it 'finds a space with using the space id' do
      user = User.store("password","linus","linus@linus.com")
      entry = Space.create(user.id,'seafront cottages', 'seafront room', 400)
      space = Space.new(entry.id,user.id, 'seafront cottages', 'seafront room', 400)
      expect(Space.find(space.id).id).to eq space.id
    end
  end
=begin
  describe '#add_date' do
    it 'adds an available date to a space' do
      linus = User.store("password2","linus","linus@linus.com")
      space = Space.create(linus.id, 'seafront room', 400)
      space.add_date(space.id, '2020-05-05')
      expect(space.available_dates).to eq ['2020-05-05']
    end
  end
=end
  describe '#middle_dates' do
  it 'returns the dates in between the min and max dates' do
    expect(Space.middle_dates('2020-10-10', '2020-10-15')).to eq ['2020-10-10','2020-10-11', '2020-10-12', '2020-10-13', '2020-10-14', '2020-10-15']
  end
end

end
