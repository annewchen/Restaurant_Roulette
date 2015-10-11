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

    event = Event.create(street_address: params[:event][:street_address])
    user.events << event

    p "*" * 20

=begin
    params["invitations"].each do |invitation|
      if invitation["full_name"] != "" || invitation["phone_number"] != ""
        invitation = Invitation.create(invitations_params(invitation))
        event << invitation
      end
    end
=end

    p "*" * 30
    p "In Create"
    render plain: params[:event].inspect
  end

  def invitations_params(my_params)
    my_params.permit(:alias, :phone_number)
  end

end
