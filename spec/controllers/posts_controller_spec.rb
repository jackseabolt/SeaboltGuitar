require 'rails_helper'

RSpec.describe PostsController, type: :controller do

let!(:first_post) { Post.create(title: "Title", body: "Body")}

	describe "GET index" do 

		before { get :index }

		it 'returns with http success' do 
			expect(response).to have_http_status(:success)
		end 

		it 'renders index view' do 
			expect(response).to render_template('index')
		end

		it 'assigns @posts' do  
			expect(assigns(:posts)).to eq([first_post])
		end 

	end 


	describe "GET show" do 

		before do 
			get :show, params: { id: first_post.id } 
		end

		it "returns with http success" do 
			expect(response).to have_http_status(:success)
		end

		it "renders the show view" do  
			expect(response).to render_template('show')
		end

		
		it "assigns @post" do 
			expect(assigns(:post)).to eq(first_post)
		end


	end

	describe "GET new" do 

		before { get :new }

		it "assigns @post" do 
			expect(assigns(:post)).to be_a_new(Post)
		end 

		it "returns with http success" do 
			expect(response).to have_http_status(:success)
		end

		it "render new view" do 
			expect(response).to render_template('new')
		end 

	end


	describe "POST create" do  

		context "when valid" do 
			before { post :create, post: {title: "title", body: "body"}}

			it "will redirect to root path" do 
				expect(response).to redirect_to(posts_path)
			end 

			it "will flash[:success]" do 
				expect(flash[:success]).to be_present
			end 
		end 

		context "when invalid" do 
			before { post :create, post: {title: "title"} }

			it "will render the new template" do 
				expect(response).to render_template('new')
			end 
		end 
	end 

	describe "PUT update" do 

		context "when valid" do 
			before { put :update, post: { title:"title", body: "body" }, id: first_post.id }

			it "will redirect to posts path" do 
				expect(response).to redirect_to(posts_path)
			end

			it "will flash[:success]" do 
				expect(flash[:success]).to be_present
			end
		end 

		context "when invalid" do 
			before { put :update, post: {title: "testing",}, id: first_post.id }

			it "will render the edit post path" do 
				expect(response).to render_template('edit')
			end 
		end 
	end 

	describe "DELETE destroy" do 
		before { delete :destroy, id: first_post.id }

		it "will redirect to posts path" do 
			expect(response).to redirect_to(posts_path)
		end

		it "will flash[:success]" do 
			expect(flash[:success]).to be_present
		end 
	end

end


