class CatsController < ApplicationController

  before_action :ensure_user_owns_cat, only: [:edit, :update]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat)
      .permit(:age, :birth_date, :color, :description, :name, :sex)
  end

  def ensure_user_owns_cat
    @cat = Cat.find(params[:id])
    if current_user.nil?
      flash[:errors] = ["That's not your cat"]
      redirect_to cat_url(@cat.id)
      return
    end
    unless @cat.owner.id == current_user.id
      fail
      flash[:errors] = ["That's not your cat"]
      redirect_to cat_url(@cat.id)
    end
  end
end
