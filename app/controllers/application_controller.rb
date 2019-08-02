# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  # def sign_out
  #   if user == current_user
  #     session.delete(:user_id)
  #   end
  # end
end
