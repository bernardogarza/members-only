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
      render 'new'
    end
  end

  def destroy
    user = current_user
    sign_out(user)
    forget(user)
    redirect_to root_url
  end

  private

  def log_in(user)
    current_user = user
  end

  def sign_out(user)
    session.delete(:user_id) if user == current_user
  end
end
