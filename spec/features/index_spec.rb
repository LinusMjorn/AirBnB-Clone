feature 'it has a button to view listings' do
  scenario 'clicking the View Listings button shows listings' do
    signup_bear1
    login_bear1
    add_new_listing
    visit '/'
    click_button 'View Available Spaces'
    expect(page).to have_content "Trump Tower"
  end
end
