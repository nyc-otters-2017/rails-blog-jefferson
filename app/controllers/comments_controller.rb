class CommentsController < ApplicationController

  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    post = Post.all(params[:id])
    @comment = post.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @comment
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
