require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	describe "GET index" do 

		it 'returns with http success' do 
			get :index
			expect(response).to have_http_status(:success)
		end 

		it 'renders index view' do 
			get :index
			expect(response).to render_template('index')
		end

	end 


	describe "GET show" do 

		before do 
			@post = Post.create(title: 'test', body: 'testing')
			get :show, params: { id: @post.id } 
		end

		it "returns with http success" do 
			expect(response).to have_http_status(:success)
		end

		it "renders the show view" do  
			expect(response).to render_template('show')
		end

		after do 
			@post.destroy
		end

	end

	describe "GET new" do 

		before do 
			get :new
		end

		it "returns with http success" do 
			expect(response).to have_http_status(:success)
		end

		it "render new view" do 
			expect(response).to render_template('new')
		end 

	end


	# describe "POST create" do 

	# 	before do 
	# 		@post = Post.build(title: "test", body: "testing")
	# 		post :create(@post)
	# 	end 

	# 	it "responds with http success" do 
	# 		expect(response).to have_http_status(:success)
	# 	end 

	# 	it "redirects to the index view" do 
	# 		expect(response).to redirect_to posts_path
	# 	end 

	# end 

end


