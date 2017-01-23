class CommentsController < ApplicationController

  def create
    require_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    require_user
    @comment = Comment.find(params[:id])
  end

  def update
    require_user
    @post = Post.find([params[:post_id]])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    require_user
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
