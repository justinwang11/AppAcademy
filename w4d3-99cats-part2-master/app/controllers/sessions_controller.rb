class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(session_params)
    if @user.nil?
      #flash.now[:errors]
      redirect_to new_session_url
    else
      login_user!
      redirect_to cats_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to cats_url
  end

  def new
  end

  private

  def session_params
    params.permit(:user_name, :password)
  end
end
