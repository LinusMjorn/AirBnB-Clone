
def signup_bear1
    visit('/')
    fill_in 'username', :match => :first, with: 'Bear'
    fill_in 'email', :match => :first, with: 'Bear@bear.com'
    fill_in 'password',:match => :first, with: 'bear123'
    click_button 'Signup'
end



def login_bear1
    visit('/')
    fill_in 'login_username', :match => :first, with: 'Bear'
    fill_in 'login_password', :match => :first, with: 'bear123'
    click_button 'Login'
end


def signup_happyotter
  visit('/')
  fill_in 'username', :match => :first, with: 'HappyOtter'
  fill_in 'email', :match => :first, with: 'happyotter@bear.com'
  fill_in 'password',:match => :first, with: 'otter123'
  click_button 'Signup'
end



def login_happyotter
  visit('/')
  fill_in 'login_username', :match => :first, with: 'HappyOtter'
  fill_in 'login_password', :match => :first, with: 'otter123'
  click_button 'Login'
end

