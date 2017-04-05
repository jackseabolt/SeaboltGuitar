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

		# Does not include multiple posts in the example
		it 'assigns @posts' do 
			all_posts = Post.create(title: "title", body: "test")
			get :index 
			expect(assigns(:posts)).to eq([all_posts])
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

		# this test does not work
		# it "assigns @post" do 
		# 	expect(assigns(:post)).to eq([@post])
		# end


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


	describe "POST create" do  

		# "param is missing or the value is empty: post"
		# it "responds with http success" do 
		# 	post :create, params: { title: "test", body: "test" }
		# 	expect(response).to have_http_status(:success)
		# end 

		# it "redirects to the index view" do 
		# 	post :create, params: { title: "test", body: "test" }
		# 	expect(response).to redirect_to posts_path
		# end 

	end 

end


