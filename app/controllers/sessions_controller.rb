class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in(user)
      remember user
      # Redirect to the posts page
    else
      render 'new'
    end
  end

  def destroy
    user = current_user
    sign_out
    forget user
    redirect_to sessions_new_path
  end

  private

    def log_in(user)
      current_user = user
    end
end
