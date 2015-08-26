class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # helper_method :current_user
  #
  # def current_user
  #
  #   if session[:user_id]
  #     @current_user ||= User.find_by_id(session[:user_id])
  #
  #     unless @current_user.blank?
  #       if Time.now > @current_user.login_expires_at
  #         puts 'Login Expired'
  #         session[:user_id] = nil
  #       else
  #         return @current_user
  #       end
  #     else
  #       session[:user_id] = nil
  #     end
  #
  #   end
  #
  # end


  private

  def logged_in
    unless current_user
      flash[:danger] = "Must be logged in to perform action"
      redirect_to root_path
    end
  end

end
