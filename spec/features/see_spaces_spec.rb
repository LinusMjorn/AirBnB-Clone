require 'setup_test_database.rb'

feature 'see list of spaces' do
  scenario 'user visits the /spaces page and can see a list of spaces' do
    add_new_listing
    expect(page).to have_content 'has posted a space with description: Trump Tower for £2500 per night'
  end
end