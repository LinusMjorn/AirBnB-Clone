require_relative '../lib/user.rb'
require 'pg'
require_relative './data_helper.rb'
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

end
=begin
  describe "#store" do
  it "" do
  end
  end

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