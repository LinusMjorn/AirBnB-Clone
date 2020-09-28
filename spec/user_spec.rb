require '../lib/user.rb'
require 'pg'
require './data_helper.rb'
describe User do
  let(:email) {double "test_email" }
  let(:username) { double "test_username" }
  let(:id) {double 1}
  let(:subject) {User.new(id, email, username)}

  it {is_expected.to respond_to(:username)}
  it {is_expected.to respond_to(:email)}
  it {is_expected.to respond_to(:id)}

  describe "#store" do
    it "stores an instance of the " do
      truncates
      user = User.store("otterpassword", "HappyOtters","happyotter@gmail.com")
      persisted_data = persisted_data('users', user.id)

      expect(user.id).to eq(persisted_data.first['id'])
      expect(user.username).to eq(persisted_data.first['username'])
      expect(user.email).to eq(persisted_data.first['email'])

    end
  end
  # describe "#list" do
  # it "Create listing" do
  #   truncates
  #   user = User.store("otterpassword", "HappyOtters","happyotter@gmail.com")
  #   space = double("space", :id=> 1, :description => "Hi", :price => 20)

  # end
  # end


  describe "#find" do
    it "Find user by username and return all values" do
      truncates
      user = User.store("otterpassword", "HappyOtters","happyotter@gmail.com")
      expect(User.find("HappyOtters").username).to eq(user.username)
      expect(User.find("HappyOtters").email).to eq(user.email)
      expect(User.find("HappyOtters").id).to eq(user.id)
    end
  end
end
=begin
  
  describe "#list" do
  it "" do
  end
  end

  describe "#find"
  it "" do
  end
  end

  describe "#authenticate" do
  it "" do
  end
  end

  describe "#valid_password" do
  it "" do
  end 
  end

  describe "#valid_username" do
  it "" do
  end
  end
end
=end