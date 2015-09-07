class PostsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create]
  before_action :require_author, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
    @comments_by_parent_id = @post.comments_by_parent_id
  end

  def new
    @post = Post.new(sub_id: params[:sub_id])
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)

    @post.author = current_user
    @post.sub_ids = params[:post][:sub_ids]

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_url(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to sub_url(@post.sub)
  end

  def upvote
    @post = Post.find(params[:id])

    @vote = Vote.new(votable: @post, value: +1)

    flash[:errors] = @vote.errors.full_messages unless @vote.save

    redirect_to post_url(@post)
  end

  def downvote
    @post = Post.find(params[:id])

    @vote = Vote.new(votable: @post, value: -1)

    flash[:errors] = @vote.errors.full_messages unless @vote.save

    redirect_to post_url(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def require_author
    @post = Post.find(params[:id])

    redirect_to post_url(@post) unless @post.author == current_user
  end
end
