
feature Dashboard do
    feature '.all' do
        scenario "shows current user's spaces" do
          signup_bear1
          click_button "View Dashboard"
          add_new_listing
          
          click_button 'Log out'
          signup_happyotter
          add_new_listing
          expect(page).to have_content "HappyOtter has posted a space with description"
          expect(page).not_to have_content "Bear1 has posted a space with description"
        end
      end
    end