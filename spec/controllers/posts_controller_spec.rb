require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	describe "GET index" do 

		before do 
			posts = [ Post.create(title: 'test', body: 'testing'), 
				Post.create(title: 'test', body: 'testing') ]
		end

		it 'returns with http success' do 
			get :index
			expect(response).to have_http_status(:success)
		end 

		it 'renders index view' do 
			get :index
			expect(response).to render_template('index')
		end

		it 'displays all of the current posts' do 
			get :index 
			expect(assigns(posts)).to eq([posts])
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


	describe "POST create" do 

		before do 
			
			
		end 

		it "responds with http success" do 
			post :create, params: { title: "test", body: "test" }
			expect(response).to have_http_status(:success)
		end 

		it "redirects to the index view" do 
			post :create, params: { title: "test", body: "test" }
			expect(response).to redirect_to posts_path
		end 

	end 

end


