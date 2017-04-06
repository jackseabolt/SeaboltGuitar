class PostsController < ApplicationController

	def index 
		@posts = Post.all
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
			params.require(:post).permit(:title, :body)
		end 

end
