
feature Dashboard do
    feature '.all' do
        scenario "shows current user's spaces" do
          signup_bear1
          add_new_listing
          visit'/'
          click_button 'Log Out'
          signup_happyotter
          add_new_listing
          expect(page).to have_content "You have posted Trump Tower with description"
          expect(page).not_to have_content "Bear1 has posted Trump Tower with description"
          click_button 'Log Out'
        end
      end
    end
   