class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    require_user
    @post = Post.new
  end

  def create
    require_user
    @post = current_user.articles.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    require_user
    @post = Post.find(params[:id])
  end

  def update
    require_user
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    require_user
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :article)
  end

end
