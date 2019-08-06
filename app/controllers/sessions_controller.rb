# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      remember user
      redirect_to posts_path
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    user = current_user
    sign_out(user)
    forget(user)
    redirect_to root_url
  end
end
