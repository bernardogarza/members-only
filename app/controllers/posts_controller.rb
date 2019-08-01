class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def index
	end

	def new
		@post = Post.new
	end

	def create
		
	end

	private

		def logged_in_user
			unless logged_in?
				redirect_to root_url
			end
		end
end
