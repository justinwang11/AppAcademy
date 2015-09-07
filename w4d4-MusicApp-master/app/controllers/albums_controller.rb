class AlbumsController < ApplicationController

  before_action :require_login

  def new
    @bands = Band.all
    render :new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:track][:album_id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.delete
    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :recorded)
  end
end
