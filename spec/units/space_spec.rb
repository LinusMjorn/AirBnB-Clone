require 'space'


describe Space do
  describe '.create' do
    it 'creates a new listing' do
      seafront = Space.create(15, 'seafront room', 400)
      expect(seafront).to be_a(Space)
      expect(seafront.description).to eq 'seafront room'
      expect(seafront.userid).to eq 15
      expect(seafront.price).to eq 400
    end
  end

  describe '.all' do
    it 'shows all spaces' do
      Space.create(15, 'seafront room', 400)
      Space.create(666, 'bachelor pad', 50)
      expect(Space.all[0].description).to eq 'bachelor pad'
      expect(Space.all[1].description).to eq 'seafront room'
    end
  end
end
