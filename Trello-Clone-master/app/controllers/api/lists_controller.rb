class Api::ListsController < ApplicationController

  def create
    @list = List.new(self.list_params)
    if @list.save
      render "show"
    else
      render :json => @list.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy!
    render "show"
  end

  def show
    @list = List.find(params[:id])
    @lists = @list.lists
    render :json => @list
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(self.list_params)
      render "show"
    else
      render :json => @list.errors, :status => :unprocessable_entity
    end
  end

  protected

  def list_params
    self.params[:list].permit(:title)
  end

end
