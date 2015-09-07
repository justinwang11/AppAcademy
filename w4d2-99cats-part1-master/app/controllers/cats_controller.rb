class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
    @cat_rental_requests = CatRentalRequest.where(cat_id: @cat.id).order(:start_date)
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      fail
    end
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat.id)
    else
      fail
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
  end
end
