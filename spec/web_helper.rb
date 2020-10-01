
def signup_bear1
  visit('/')
  fill_in 'username', with: 'Bear'
  fill_in 'email', with: 'Bear@bear.com'
  fill_in 'password', with: 'bear123'
  click_button 'Signup'
end

def login_bear1
  visit('/')
  fill_in 'login_username', with: 'Bear'
  fill_in 'login_password', with: 'bear123'
  click_button 'Login'
end

def signup_happyotter
  visit('/')
  fill_in 'username', with: 'HappyOtter'
  fill_in 'email', with: 'happyotter@bear.com'
  fill_in 'password', with: 'otter123'
  click_button 'Signup'
end

def login_happyotter
  visit('/')
  fill_in 'login_username', with: 'HappyOtter'
  fill_in 'login_password', with: 'otter123'
  click_button 'Login'
end

def add_new_listing
  visit '/dashboard/new'
  fill_in :description, with: 'Trump Tower'
  fill_in :price, with: 2500
  click_button 'Post Space'
end


