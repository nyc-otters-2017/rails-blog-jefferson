class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to users_path
  end

end
