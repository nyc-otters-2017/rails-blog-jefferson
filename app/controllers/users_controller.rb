class UsersController < ApplicationController

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to user_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :bio, :location, :email, :password)
    end

end
