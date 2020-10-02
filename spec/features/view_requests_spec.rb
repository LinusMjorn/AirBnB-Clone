require 'setup_test_database.rb'



feature 'see list of requests relevant to the user' do
  scenario 'User goes to request list page and sees a list of the requests theyve made' do
    signup_bear1
    click_button 'Dashboard'
    click_button "Add New Space"
    fill_in :description, with: 'House Boat'
    fill_in :price, with: 100
    click_button 'Post Space'
    click_button 'Log Out'
    connection = DatabaseConnection.setup('airbnb_test')
    result1 = connection.exec("SELECT id FROM spaces WHERE description = 'House Boat';")
    connection.exec("INSERT INTO available_dates (space_id, available_date) VALUES (#{result1[0]['id']}, '2021-05-05');")

    signup_happyotter
    click_button 'Request'
    fill_in booking_date, with: '2021-05-05'
    click_button 'book now'
    click_button 'Manage Requests'
    
    expect(page).to have content 'You have requested to stay at Trump Tower on 2021-05-05'
  end
end

feature 'it has navigation buttons' do
  scenario 'the page displays navigation buttons' do
    signup_bear1
    visit '/requests'
    expect(page).to have_button "Home"
    expect(page).to have_button "Dashboard"
    expect(page).to have_button "Log Out"
  end
end
# feature 'see list of requests relevant to the user' do
#   scenario 'User goes to request list page and sees a list of the requests theyve made and a list of requests made for their spaces' do
    
#   end
# end