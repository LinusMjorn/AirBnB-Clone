require 'setup_test_database.rb'

feature 'see list of requests relevant to the user' do
  scenario 'User goes to request list page and sees a list of the requests theyve made' do
    signup_bear1
    #login_bear1
    add_new_listing
    visit("/")
    visit '/sessions/logout'
    signup_happyotter
    first(:button, 'Request Space', minimum: 1).click
    #first('.space').click_button 'Request Space'
    click_button 'View My Spaces'
    click_button 'Manage My Requests'
    expect(page).to have content 'You have requested to stay at Trump Tower on 2021-01-01'
  end
end

# feature 'see list of requests relevant to the user' do
#   scenario 'User goes to request list page and sees a list of the requests theyve made and a list of requests made for their spaces' do
    
#   end
# end