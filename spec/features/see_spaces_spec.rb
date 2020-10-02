
feature 'see list of spaces' do
  scenario 'user visits the /dashboard page and can see a list of spaces' do
    signup_bear1
    add_new_listing
    expect(page).to have_content 'You have posted Trump Tower with description: Trump Tower for £2500 per night'
    click_button 'Log Out'
  end
end