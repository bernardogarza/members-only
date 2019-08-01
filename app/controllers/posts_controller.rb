class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user
		if @post.save
			redirect_to :root
		else
			render 'new'
		end
	end

	private

		def post_params
			params.require(:post).permit(:title, :text)
		end

		def logged_in_user
			unless logged_in?
				redirect_to root_url
			end
		end
end
