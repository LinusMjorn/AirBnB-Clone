feature 'Go to signup page' do
  scenario 'Signup successfully' do
    visit('/')
    signup_bear1
    click_button 'View Dashboard'
    expect(page).to have_content 'Logged in as Bear'
    click_button 'Log Out'
  end

  scenario 'Signup unsuccessfully' do
    visit('/')
    signup_bear1
    click_button 'Log Out'
    visit('/')
    signup_bear1
    expect(page).to have_current_path('/')
    expect(page).to have_content('Username or email is taken')
  end

  scenario 'Login unsuccessfully' do
    visit('/')
    signup_bear1
    click_button 'Log Out'
    visit('/')
    login_happyotter
    expect(page).to have_content "Login details incorrect"  
  end

  feature 'Log out' do
      scenario ' User can logout succesfully' do
        visit('/')
        signup_bear1
        click_button 'Log Out'
        expect(page).to have_content "You have logged out"
      end
  end
end