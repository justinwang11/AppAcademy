class BandsController < ApplicationController

  before_action :require_login
  
  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(params.require("@band").permit(:name))
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
