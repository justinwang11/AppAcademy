class TracksController < ApplicationController

  before_action :require_login
  
  def new
    render :new
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.delete
    redirect_to bands_url
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :lyrics)
  end
end
