require 'space'

describe Space do
  describe '.create' do
    it 'creates a new listing' do
      seafront = Space.create('rita', 'seafront room', 400)
      expect(seafront).to be_a(Space)
      expect(seafront.description).to eq 'seafront room'
      expect(seafront.username).to eq 'rita'
      expect(seafront.price).to eq 400
    end
  end

  describe '.all' do
    it 'shows all spaces' do
      Space.create('rita', 'seafront room', 400)
      Space.create('beney', 'bachelor pad', 50)
      expect(Space.all[0].description).to eq 'seafront room'
      expect(Space.all[1].description).to eq 'bachelor pad'
    end
  end
end
