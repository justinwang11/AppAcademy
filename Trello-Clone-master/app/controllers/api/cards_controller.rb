class Api::CardsController < ApplicationController

  def index
  end

  def show
    render :json => Card.find(params[:id])
  end

  def new
  end

  def create
    card = Card.new(card_params)
    if card
      render :json => card
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

end
