
feature 'see list of spaces' do
  scenario 'user visits the /dashboard page and can see a list of spaces' do
    signup_bear1
    add_new_listing
    expect(page).to have_content 'has posted a space with description: Trump Tower for £2500 per night'
  end
end