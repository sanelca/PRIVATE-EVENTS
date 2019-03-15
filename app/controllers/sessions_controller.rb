class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      flash[:success] = "You are signed in."
      redirect_to @user
    else
      flash[:danger] = "Invalid email or password."
      redirect_to new_session_path
    end
  end

  def destroy
    user = User.find(params[:id])
    logout(user)
    flash[:success] = "You logged out."
    redirect_to root_url
  end
end
