class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show]

  def index
    @upcoming_events = Event.upcoming.limit(3)
    @past_events = Event.past.limit(3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "You have successfully created account."
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.events.upcoming
    @invitations = @user.attendances
    @past_events = @user.events.past
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      flash[:success] = "Your account has been updated."
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    logout(user)
    @current_user = nil
    user.destroy
     flash[:success] = "Your account has been deleted."
     redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end  
end
