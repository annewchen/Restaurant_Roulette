class EventsController < ApplicationController
  def index
    session[:user_id] = current_user.id
    @user = User.find_by(id: session[:user_id])
    @invitations = []
    5.times do
      @invitations << Invitation.new
    p "*" * 30
    p @invitations
    end

  end

  def new
    p "*" * 30
    p "In New"
  end

  def create
    user = User.find_by(id: current_user.id)

    params[:invitation].each do |invitation|
      Invitation.new(name: invitation)
      end

    p "*" * 30
    p "In Create"
    render plain: params[:event].inspect



=begin
    p "*" * 20
    event = Event.new(street_address: params[:event][:street_address])
    p event
    user.events << event
    p user.events
    p params[:event][:street_address]
=end
  end

  def invitations_params(my_params)
    my_params.permit(:alias, :phone_number)
  end

end
