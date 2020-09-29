require 'request'

describe Request do
  describe '#new' do
    it 'a new request has id, proposed date, guest-id and space-id' do
      request = Request.new(45, '30/09/2020', 75, 2)
      expect(request.id).to eq 45
      expect(request.date).to eq '30/09/2020'
      expect(request.guest_id).to eq 75
      expect(request.space_id).to eq 2
      expect(request.approved).to eq 0
    end
  end

  # describe '.create' do
  #   it 'adds a row to the bookings table and returns a Request object' do
      
  #   end
  # end
end