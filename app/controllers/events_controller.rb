require 'text_messages_helper'

class EventsController < ApplicationController
  def index
    session[:user_id] = current_user.id
    add_invited_friends
  end

  def create
    p "params:#{params}"
    @user = User.find_by(id: current_user.id)
    @event = Event.new(street_address: params[:event][:street_address])
    add_invited_friends

    if @event.save && params[:full_name] && params[:phone_number]
      @user.events << @event
      index = 0
      participant_count = params[:full_name].count
      p "*" * 80
      p "p count: #{participant_count}"
      participant_count.times do
        invitation = Invitation.new(full_name: params[:full_name][index], phone_number: params[:phone_number][index])
        if invitation.save
          index+=1
          @event.invitations << invitation
        else
          flash.now[:invitation_error] = "Please check guest name and phone number format"
          break
        end
      end


      if flash[:invitation_error]  # there was a problem
          render "index"
      else
        begin
          #text all invitees
          TextMessagesHelper.send_text_messages_to_invitees_and_planner(@event)
          render "event_saved"
        rescue Twilio::REST::RequestError => e
          p "$$$$$$$$$$$$$$$$$ twilio error: #{e.message}"
          flash.now[:invitation_error] = e.message
          render "index"
        end
      end
    else #else for event save
      flash.now[:event_error] = "You need to enter a location and invite at least one person"
      render "index"

    end #end for if event.save
  end #end for create method

  def invitations_params(my_params)
    my_params.permit(:full_name, :phone_number)
  end

  private 

  def add_invited_friends
    @user = User.find_by(id: session[:user_id])

    p "#" * 30
    p "In events index..."
    @previously_invited_friends = {}
    @previously_invited_phone_numbers = {}

    # construct a phone book mapping all names to phone numbers
    # and construct a reverse phonebook matching all phone numbers
    @user.events.each do |event|
      event.invitations.each do |invitation|
        @previously_invited_friends[invitation.full_name] = invitation.phone_number
        @previously_invited_phone_numbers[invitation.phone_number] = invitation.full_name
      end
    end

  end

end
