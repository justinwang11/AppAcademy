class CommentsController < ApplicationController

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.new(comment_params)
    url = @commentable.is_a?(User) ? user_url(@commentable) : goal_url(@commentable)
    @comment.save
    flash[:errors] = @comment.errors.full_messages
    redirect_to url
  end

  def destroy
    # commentable = find_commentable
    # url = commentable.is_a?(User) ? user_url(commentable) : goal_url(commentable)
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    params[:comment].each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
