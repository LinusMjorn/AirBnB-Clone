require 'setup_test_database.rb'

feature 'see list of spaces' do
  scenario 'user visits the /spaces page and can see a list of spaces' do
    visit '/spaces/new'
    fill_in :description, with: 'seafront flat'
    fill_in :price, with: '400'
    click_button 'Post Listing'
    expect(page).to have_content 'has posted a space with description: seafront flat'
  end
end