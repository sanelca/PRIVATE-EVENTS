class InvitationsController < ApplicationController
  before_action :correct_user

  def create
    @event = Event.find(params[:event_id])
    guest = User.find_by(email: params[:invitation][:guest_email])
    if guest && @event
      @event.invitations.create(guest_id: guest.id)
      flash[:success] = "You have added #{guest.name} to this event."
      redirect_to @event
    else
      flash[:danger] = "Please try again."
      redirect_to @event
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    invitation = Invitation.find_by(event_id: params[:event_id], guest_id: params[:guest_id])
    invitation.destroy
    flash[:success] = "You have successfully declined this event."
    redirect_to @event
  end

  private

  def correct_user
    user = User.find(params[:id])
    unless user == current_user
      flash[:danger] = "You are not authorized!"
      redirect_to root_url
    end
  end
end
