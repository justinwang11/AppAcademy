class CatRentalRequestsController < ApplicationController
  def index
    @cat_rental_requests = CatRentalRequest.where(cat_id: params[:cat_id])
  end

  def new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(rental_params)
    if @cat_rental_request.save
      redirect_to Cat.find(params[:cat_rental_request][:cat_id])
    else
      fail
    end
  end

  def approve
    @cat = Cat.find(params[:cat_id])
    @rental = CatRentalRequest.find(params[:id])
    @rental.approve!

    redirect_to cat_url(@cat.id)
  end

  def deny
    @cat = Cat.find(params[:cat_id])
    @rental = CatRentalRequest.find(params[:id])
    @rental.deny!([@rental])

    redirect_to cat_url(@cat.id)
  end

  private

  def rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
