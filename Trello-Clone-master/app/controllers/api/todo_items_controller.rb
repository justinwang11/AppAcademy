class Api::TodoItemsController < ApplicationController

  def index
  end

  def show
    render :json => TodoItem.find(params[:id])
  end

  def new
  end

  def create
    todo_item = TodoItem.new(todo_item_params)
    if todo_item
      render :json => todo_item
    else
      render :json => { error: "invalid" }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def todo_item_params
    params.require(:todo_item).permit(:title)
  end

end
