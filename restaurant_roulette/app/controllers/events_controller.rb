class EventsController < ApplicationController
  def index
    session[:user_id] = current_user.id
    @user = User.find_by(id: session[:user_id])
    @invitations = []
    3.times do
      @invitations << Invitation.new
    end

  end

  def create
    user = User.find_by(id: current_user.id)

    event = Event.new(street_address: params[:event][:street_address])
    if event.save
      user.events << event

      params["invitations"].each do |invitation|
        invitation = Invitation.new(invitations_params(invitation))
        if invitation.save
          event.invitations << invitation
        else
          render "index"
        end
      end
      render "event_saved"
    else
      render "index"
=begin
  ERROR NOTE!!!! Not valid entries will cause error
=end

    end
  end

  def invitations_params(my_params)
    my_params.permit(:full_name, :phone_number)
  end

end
