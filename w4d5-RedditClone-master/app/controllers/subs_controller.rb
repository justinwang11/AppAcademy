class SubsController < ApplicationController
  before_action :must_be_moderator, only: [:edit, :update]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to subs_url
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to subs_url
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy!
    redirect_to subs_url
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def must_be_moderator
    @sub = Sub.find(params[:id])

    if !logged_in? || current_user.id != @sub.moderator_id
      redirect_to sub_url(@sub)
    end
  end
end
