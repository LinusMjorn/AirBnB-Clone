
def signup_bear1
    visit('/')
    fill_in 'username', :match => :first, with: 'Bear'
    fill_in 'email', :match => :first, with: 'Bear@bear.com'
    fill_in 'password',:match => :first, with: 'bear123'
    click_button 'Signup'
end



def login_bear1
    visit('/')
    fill_in 'username', with: 'Bear'
    fill_in 'email', with: 'Bear@bear.com'
    fill_in 'password', with: 'bear123'
    click_button 'Login'
end
