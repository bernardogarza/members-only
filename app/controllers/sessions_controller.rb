class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in(user)
      remember user
      # Redirect to the posts page
    else
      render 'new'
    end
  end

  private

    def log_in(user)
      current_user = user
    end
end
