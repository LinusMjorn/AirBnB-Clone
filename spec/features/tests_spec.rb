feature 'Go to signup page' do
  scenario 'Signup successfully' do
    visit('/')
    fill_in :username, with: 'Bear'
    fill_in :email, with: 'Bear@bear.com'
    fill_in :password, with: 'bear123'
    click_button 'Signup'
      expect(page).to have_current_path('/')
      expect(page).not_to have_content('Username or email is taken')
     
  end

  scenario 'Signup unsuccessfully' do
    visit('/')
    fill_in :username, with: 'Bear'
    fill_in :email, with: 'Bear@bear.com'
    fill_in :password, with: 'bear123'
    click_button 'Signup'
      click_button 'Log Out'
      visit('/')
  fill_in :username, with: 'Bear'
  fill_in :email, with: 'Bear@bear.com'
  fill_in :password, with: 'bear123'
  click_button 'Signup'
      expect(page).to have_current_path('/')
      expect(page).to have_content('Username or email is taken')
    
  end
end

feature 'Go to login page' do
#     scenario 'Login successfully' do
#         signup_bear1
#         click_button 'Log Out'
#         login_bear1
#         expect(page).to have_content "Logged in as Bear"
#     end

  scenario 'Login unsuccessfully' do
    visit('/')
    fill_in :username, with: 'Bear'
    fill_in :email, with: 'Bear@bear.com'
    fill_in :password, with: 'bear123'
    click_button 'Signup'
      click_button 'Log Out'
      visit('/')
      fill_in :login_username, with: 'HappyOtter'
      fill_in :login_password, with: 'otter123'
      click_button 'Login'
      expect(page).to have_content "Login details incorrect"
   
  end

  feature 'Log out' do
      scenario ' User can logout succesfully' do
        visit('/')
        fill_in :username, with: 'Bear'
        fill_in :email, with: 'Bear@bear.com'
        fill_in :password, with: 'bear123'
        click_button 'Signup'
          click_button 'Log Out'
          expect(page).to have_content "You have logged out"
      end
  end
end