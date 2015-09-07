class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    @comment.author = current_user

    if @comment.save
      redirect_to comment_url(@comment)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_comment_url
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comments_by_parent_id = @post.comments_by_parent_id
  end

  def upvote
    @comment = Comment.find(params[:id])

    @vote = Vote.new(votable: @comment, value: +1)

    flash[:errors] = @vote.errors.full_messages unless @vote.save

    redirect_to comment_url(@comment)
  end

  def downvote
    @comment = Comment.find(params[:id])

    @vote = Vote.new(votable: @comment, value: -1)

    flash[:errors] = @vote.errors.full_messages unless @vote.save

    redirect_to comment_url(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end
