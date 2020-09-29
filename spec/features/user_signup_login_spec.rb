require 'pg'


feature 'Go to signup page' do
    scenario 'Signup successfully' do
        signup_bear1
        expect(page).to have_current_path('/')
        expect(page).not_to have_content('Username or email is taken')
    end

    scenario 'Signup unsuccessfully' do
            signup_bear1
            signup_bear1
            expect(page).to have_current_path('/')
            expect(page).to have_content('Username or email is taken')
    end
end

feature 'Go to login page' do
    scenario 'Login successfully' do
        signup_bear1
        login_bear1
        expect(page).to have_content "Logged in as Bear"
    end

    scenario 'Login unsuccessfully' do
        signup_bear1
        login_happyotter
        expect(page).to have_content "Login details incorrect"
    end
end