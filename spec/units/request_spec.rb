require 'request'

describe Request do

  let(:john) { double( 'User', ) }

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

  describe '.create' do
    it 'adds a row to the bookings table and returns a Request object' do
      request = Request.create('2020-09-30', 75, 2)
      expect(request.date).to eq '2020-09-30'
      expect(request.guest_id).to eq 75
      expect(request.space_id).to eq 2
      expect(request.approved).to eq 0
    end
  end


  describe '.my_requests' do
    it 'pulls requests from the database into an array of request objects' do
      Request.create('2020-09-30', 75, 2)
      Request.create('2020-01-01', 76, 3)
      expect(Request.my_requests(75).first.date).to eq '2020-09-30'
      expect(Request.my_requests(76).last.date).to eq '2020-01-01'
    end
  end

end