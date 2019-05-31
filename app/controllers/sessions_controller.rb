class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      flash[:info] = "You are now signed in"
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email and/or password"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:info] = "You are now signed out"
    redirect_to root_url
  end
  
end
