require 'text_messages_helper'

class EventsController < ApplicationController
  def index
    session[:user_id] = current_user.id
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @user = User.find_by(id: current_user.id)
    participant_count = params[:full_name].count
    @event = Event.new(street_address: params[:event][:street_address])

    if @event.save
      @user.events << @event
      index = 0
      participant_count.times do
        invitation = Invitation.new(full_name: params[:full_name][index], phone_number: params[:phone_number][index])
        if invitation.save
          index+=1
          @event.invitations << invitation
          render "event_saved"
        else
          flash[:notice] = "Please check guest name and phone number format"
          render "index"
        end
      end

        #text all invitees
    TextMessagesHelper.send_text_messages_to_invitees_and_planner(@event)

    else #else for event save
      render "index"

    end #end for if event.save
  end #end for create method

  def invitations_params(my_params)
    my_params.permit(:full_name, :phone_number)
  end

end
