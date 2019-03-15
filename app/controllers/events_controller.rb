class EventsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created."
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.host
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    if @event.save
      flash[:success] = "Event has been updated."
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    @user = event.host
    event.destroy
    flash[:success] = "Event has been deleted."
    redirect_to @user
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :location, :description)
  end
end
