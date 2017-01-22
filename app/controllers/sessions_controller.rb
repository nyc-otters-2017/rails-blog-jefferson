class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login user
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
