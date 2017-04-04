require 'rails_helper'

RSpec.feature "Creating a post" do 

	before do 
		@user = User.create(password: 'testing', email: "testing@gmail.com")
	end 


	scenario "A logged in user creates a post" do 
		visit '/'
		click_link "Login"
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Login"
		click_link "New Post"
		fill_in "Title", with: "My Post"
		fill_in "Body", with: "My content"
		click_button "Create"
		expect(page).to have_content("Your post has been created")
		expect(page.current_path).to eq(posts_path)
		expect(page).to have_content("My Post")
		expect(page).to have_content("My content")
	end

	scenario "A logged in user attempts to create an invalid title" do 
		visit '/'
		click_link "Login"
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Login"
		click_link 'New Post'
		fill_in 'Body', with: 'Content'
		click_button 'Create'
		expect(page).to have_content("There was a problem with your post")
		expect(page).to have_content("Title can't be blank")
	end 

	scenario "A logged in user attempts to create an invalid content" do 
		visit '/'
		click_link "Login"
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Login"
		click_link 'New Post'
		fill_in 'Title', with: 'Content'
		click_button 'Create'
		expect(page).to have_content("There was a problem with your post")
		expect(page).to have_content("Body can't be blank")
	end
end 