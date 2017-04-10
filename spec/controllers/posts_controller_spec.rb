require 'rails_helper'

RSpec.describe PostsController, type: :controller do 
	

	let!(:test_post) { Post.create( title:"test", body: "testing", video: "test" ) }

	describe "GET index" do 

		before { get :index }

		it "renders the #index template" do 
			expect(response).to render_template('index')
		end

		it "assigns @posts" do 
			expect(assigns(:posts)).to eq([test_post])
		end

		it "has http success" do
			expect(response).to have_http_status(200)
			# or :success
		end 

	end 

	describe "GET show" do 

		before { get :show, params: { id: test_post } }

		it "renders the #show template" do 
			expect(response).to render_template('show')
		end 

		it "returns with http sucess" do 
			expect(response).to have_http_status(200)
			# or :success
		end

		it "assigns @post" do 
			expect(assigns(:post)).to eq(test_post)
		end 

	end 

	describe "GET new" do 

		before { get :new }

		it "render the #new template" do 
			expect(response).to render_template('new')
		end 

		it "returns with http success" do 
			expect(response).to have_http_status(200)
			# or :success
		end 

		it "assigns @post" do 
			expect(assigns(:post)).to be_a_new(Post)
		end 

	end

	describe "POST create" do 

		context "when valid" do 

			before { post :create, post: {title:"testing", body: "testing", video: 'test'} }

			it 'creates a new post' do
     			expect(Post.count).to eq(2)
  			end

			it "returns with http success" do 
				expect(response).to have_http_status(302)
			end

			it "redirects to posts path" do  
				expect(response).to redirect_to(posts_path)
			end

			it "will flash[:success]" do 
				expect(flash[:success]).to be_present
			end

		end

		context "when invalid" do 

			before { post :create, post: {title: "testing"} }

			it "returns with http status of success" do 
				expect(response).to have_http_status(200)
			end

			it "renders #new template" do 
				expect(response).to render_template('new')
			end 

		end 

	end 

	describe "GET edit" do 

		before { get :edit, id: test_post }

		it "has an http response of success/200" do 
			expect(response).to have_http_status(200)
		end 

		it "renders #edit template" do 
			expect(response).to render_template('edit')
		end 

		it "assigns @post" do
      		expect(assigns(:post)).to eq(test_post)
    	end

	end 

	describe "PATCH update" do 

		context "when valid" do 

			before do 
				patch :update, id: test_post, post: {title: 'other', body: 'other'}
				test_post.reload
			end

			it "has an http response status of 302" do 
				expect(response).to have_http_status(302)
			end 
			
			it "renders the #index template" do 
				expect(response).to redirect_to(posts_path)
			end

			it "updates post" do 
				expect(test_post.title).to eq('other')
			end
		end 
	end 

	describe "DELETE destroy" do 

		before { delete :destroy, params: { id: test_post } }

		it "deletes posts" do 
			expect(Post.count).to eq(0)
		end

		it "has http response status" do 
			expect(response).to have_http_status(302)
		end 

		it "redirects to posts_path" do 
			expect(response).to redirect_to(posts_path)
		end 

		it "will flash[:success]" do 
			expect(flash[:success]).to be_present
		end

	end 

end 
