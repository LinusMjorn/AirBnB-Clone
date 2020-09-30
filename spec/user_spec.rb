# frozen_string_literal: true

require './lib/user.rb'
require 'pg'
require 'data_helper.rb'

describe User do
  let(:email) { double 'test_email' }
  let(:username) { double 'test_username' }
  let(:id) { double 1}
  let(:subject) {User.new(id, email, username)}

  it {is_expected.to respond_to(:username)}
  it {is_expected.to respond_to(:email)}
  it {is_expected.to respond_to(:id)}

  describe '#store' do
    it 'stores an instance of the ' do
      truncates
      user = User.store('otterpassword', 'HappyOtters', 'happyotter@gmail.com')
      persisted_data = persisted_data('users', user.id)

      expect(user.id).to eq(persisted_data.first['id'])
      expect(user.username).to eq(persisted_data.first['username'])
      expect(user.email).to eq(persisted_data.first['email'])
    end
  end

  describe '#authenticate' do
    it 'returns true with correct password' do
      user = User.store('otterpassword', 'HappyOtters', 'happyotter@gmail.com')
      expect(User.authenticate?('HappyOtters', 'otterpassword')).to eq true
    end
    it 'returns false with incorrect password' do
      expect(User.authenticate?('HappyOtters', 'nototterpassword')).to eq false
    end
  end

  describe '#valid username' do
    it 'it returns true if you try to create two people with the same usernme' do
      User.store('otterpassword', 'HappyOtters', 'happyotter@gmail.com')
      expect(User.duplicated_username?('HappyOtters')).to eq true
    end

    it 'returns false when you create a new unique username' do
      User.store('otterpassword', 'HappyOtters', 'happyotter@gmail.com')
      expect(User.duplicated_username?('HappierOtters')).to eq false
    end
  end

  describe '#unique email' do
    it 'it returns false if you try to create a user with the same email' do
      User.store('otterpassword', 'HappyOtters', 'happyotter@gmail.com')
      expect(User.unique_email?('happyotter@gmail.com')).to eq false
    end

    it 'it returns true if you try to create a user with a unique email' do
      User.store('otterpassword', 'HappyOtters', 'happyotter@gmail.com')
      expect(User.unique_email?('happyotter2@gmail.com')).to eq true
    end
  end

  describe '#find' do
    it 'Find user by username and return all values' do
      truncates
      user = User.store('otterpassword', 'HappyOtters', 'happyotter@gmail.com')
      expect(User.find('HappyOtters').username).to eq(user.username)
      expect(User.find('HappyOtters').email).to eq(user.email)
      expect(User.find('HappyOtters').id).to eq(user.id)
    end
  end
end
#
#   describe "#list" do
#   it "" do
#   end
#   end
#
#   describe "#find"
#   it "" do
#   end
#   end
#
#   describe "#authenticate" do
#   it "" do
#   end
#   end
#
#   describe "#valid_password" do
#   it "" do
#   end
#   end
#
#   describe "#valid_username" do
#   it "" do
#   end
#   end
# end

# describe "#list" do
# it "Create listing" do
#   truncates
#   user = User.store("otterpassword", "HappyOtters","happyotter@gmail.com")
#   space = double("space", :id=> 1, :description => "Hi", :price => 20)

# end
# end
