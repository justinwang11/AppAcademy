class GoalsController < ApplicationController
  def index
    @goals = Goal.where('privacy = ? OR user_id = ?', false, current_user.try(:id))
  end

  def new
    @goal = Goal.new
  end

  def show
    @goal = Goal.find(params[:id])
    @completion_status = @goal.completion ? "Completed" : "Incomplete"
    @comments = @goal.comments
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy!
    redirect_to goals_url
  end

  def goal_params
    params.require(:goal).permit(:title, :privacy, :completion)
  end
end
