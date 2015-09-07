class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login_user(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid login"]
      redirect_to new_sessions_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_sessions_url
  end
end
