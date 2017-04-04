require 'rails_helper'

RSpec.feature "Listing posts" do 

	before do 
		@post1 = Post.create(title: "title one", body: "body one")
		@post2 = Post.create(title: "title two", body: "body two")
	end

	scenario "a user lists posts in the index page" do
		visit '/'
		expect(page).to have_content(@post1.title)
		expect(page).to have_content(@post1.body)
		expect(page).to have_content(@post2.title)
		expect(page).to have_content(@post2.body)
	end 

end
