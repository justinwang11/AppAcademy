class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    helper_method :current_user

    def current_user
      @user ||= User.find_by(session_token: session[:session_token])
    end

    def login_user!
      session[:session_token] = current_user.reset_session_token!
    end

end
