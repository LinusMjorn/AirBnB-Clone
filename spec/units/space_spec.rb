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
end
