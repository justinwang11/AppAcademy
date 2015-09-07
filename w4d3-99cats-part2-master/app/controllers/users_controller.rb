class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    @user.password=(user_params[:password])
    @user.reset_session_token!
    if @user.save
      login_user!
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      @user = nil
      render :new
    end
  end

  private

  def user_params
    params.permit(:user_name, :password)
  end

end
