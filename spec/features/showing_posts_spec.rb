require 'rails_helper'

RSpec.feature "Showing posts" do 

	before do 
		@post = Post.create(title: "title", body: "body stuff", video: 'test')
	end 

	scenario "A user goes to the show page for a post" do 
		visit '/'
		click_link @post.title
		expect(page.current_path).to eq(post_path(@post))
		expect(page).to have_content(@post.body)
		expect(page).to have_content(@post.title)
	end

end