require "rails_helper"

RSpec.feature "Signing in" do 

	before do 
		@user = User.create(email: "testing@email.com", password: "testing")
	end

	scenario "A user signs in with valid information" do
		visit '/'
		click_link "Login"
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Login"
		expect(page).to have_content("New Post")
		expect(page).to have_content("Logout")
		expect(page).not_to have_content('Login')
	end 

end 