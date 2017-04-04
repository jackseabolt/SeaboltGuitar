require 'rails_helper'

RSpec.feature 'Editing a post' do 


	before do 
		@post = Post.create(body: "Body", title: "My title")
		@user = User.create(email: "testing@gmail.com", password: "testing")
	end 

	scenario "A logged in user edits a post from the index view" do 
		visit '/'
		click_link "Login"
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Login"
		click_link 'Edit'
		fill_in "Title", with: "Other"
		fill_in "Body", with: "Body other"
		click_button "Update"
		expect(page.current_path).to eq(posts_path)
		expect(page).to have_content("Other")
		expect(page).to have_content("Body other")
	end 

	scenario "A non-logged in user cannot edit a post from index view" do 
		visit '/'
		expect(page).not_to have_content("Edit")
	end 

	scenario "A logged in user edits a post from the show view" do 
		visit '/'
		click_link "Login"
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Login"
		click_link @post.title
		click_link "Edit"
		fill_in "Title", with: "other content"
		fill_in "Body", with: "something else"
		click_button "Update"
		expect(page).to have_content("other content")
		expect(page).to have_content("something else")
	end 

	scenario "A non-logged in user cannot edit a post from the show view" do 
		visit '/'
		click_link @post.title
		expect(page).not_to have_content('Edit')
	end 

	scenario "A logged in user attempts to edit post with invalid data" do 
		visit '/'
		click_link "Login"
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Login"
		click_link 'Edit'
		fill_in "Title", with: "Some info"
		fill_in "Body", with: ""
		click_button "Update"
		expect(page).to have_content("There was a problem with your post")
		expect(page).to have_content("Body can't be blank")
	end 
end 