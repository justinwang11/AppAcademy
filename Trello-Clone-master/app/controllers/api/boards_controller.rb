class Api::BoardsController < ApplicationController

  def create
    @board = Board.new(self.board_params)
    if @board.save
      render "show"
    else
      render :json => @board.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy!
    render "show"
  end

  def index
    @boards = Board.all
    @boards.each do |board|
      @lists = board.lists
      @cards = board.cards
      @todo_items = board.todo_items
    end
    render "index"
  end

  def show
    @board = Board.find(params[:id])
    @lists = @board.lists
    @cards = @board.cards
    @todo_items = @board.todo_items

    render "show"
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(self.board_params)
      render "show"
    else
      render :json => @board.errors, :status => :unprocessable_entity
    end
  end

  protected

  def board_params
    self.params[:board].permit(:title)
  end

end
