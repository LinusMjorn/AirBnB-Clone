feature 'it has a button to view listings' do
  scenario 'clicking the View Listings button shows listings' do
    signup_bear1
    add_new_listing
    visit '/'
    click_button 'View Dashboard'
    expect(page).to have_content "Trump Tower"
    click_button 'Log Out'
  end
end

