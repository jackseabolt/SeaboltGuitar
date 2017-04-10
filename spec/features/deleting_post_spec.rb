require 'rails_helper'

RSpec.feature "Deleting posts" do 

	before do 
		@user = User.create!(email: 'testing@gmail.com', password: "testing")
		@post = Post.create(title: "Title", body: "My body content", video: "test")
	end

	scenario "A logged in user deletes a post from the index view" do 
		visit '/'
		click_link 'Login'
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Login"
		visit '/'
		click_link "Delete"
		expect(page).to have_content('Your post has been deleted')
	end

	scenario "A non-logged in user deletes a post from the index view" do 
		visit '/'
		expect(page).not_to have_content('Delete')
	end

	scenario "A logged in user deletes a post from the show view" do
		visit '/'
		click_link 'Login'
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Login" 
		visit '/'
		click_link @post.title
		click_link "Delete"
		expect(page).to have_content('Your post has been deleted')
	end

	scenario "A non-logged in user deletes a post from the show view" do
		visit '/'
		click_link @post.title
		expect(page).not_to have_content('Delete')
	end

end 