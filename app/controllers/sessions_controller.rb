class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      remember user
      redirect_to static_pages_index_path
    else
      render 'new'
    end
  end

  def destroy
    user = current_user
    sign_out
    forget user
    redirect_to :root
  end

  private

    def log_in(user)
      current_user = user
    end

    def sign_out
      if user == current_user
        session.delete(:user_id)
      end
    end
end
