class PostsController < ApplicationController

	def index 
		@posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 4)
		@beginner = Post.all.where(category: 'Beginner')
		@strumming = Post.all.where(category: "Strumming")
		@fingerpicking = Post.all.where(category: "Fingerpicking")
		@lead = Post.all.where(category: "Lead")
		@exercises = Post.all.where(category: "Exercises")
	end 

	def show 
		@post = Post.find(params[:id])
	end 

	def new 
		@post = Post.new 
	end 

	def create 
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Your post has been created"
			redirect_to posts_path 
		else
			render new_post_path
		end

	end 

	def edit
		@post = Post.find(params[:id])
	end 

	def update 
		@post = Post.find(params[:id])
		 if @post.update_attributes(post_params)
			redirect_to posts_path
			flash[:success] = "Your post has been updated"
		else 
			render 'edit'
		end 
	end 

	def destroy 
		@post = Post.find(params[:id])
		if @post.delete 
			redirect_to posts_path
			flash[:success] = "Your post has been deleted"
		else
			render 'posts_path'
			flash[:danger] = "There was a problem deleting your post"
		end
	end 


	private 

		def post_params
			params.require(:post).permit(:title, :body, :video, :category)
		end 

end
