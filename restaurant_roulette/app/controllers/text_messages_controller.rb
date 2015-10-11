require 'twilio-ruby'

class TextMessagesController < ApplicationController
  def index
    p "*" * 20
    p "In text_messages index"
    p "*" * 20

    # TODO: currently hardcoding this to the first event in our database.
    # Remove this eventually when we integrate with the rest of the code flow.
    current_event = Event.find(1)
    # send_text_messages_to_invitees_and_planner(current_invite)
    send_final_selection_to_planner(current_event)

  end

  private

  def send_text_messages_to_invitees_and_planner(event)
    p "in send_text_messages_to_invitees_and_planner "

    account_sid = "AC6882f6d03c767dfed68ddd6e61554b76"
    auth_token = "b6c51acfab9f2d0ceefee450d074cc2c"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+15105008394" # Your Twilio number

    # send message to invitees
    event.invitations.each do |invitation|
      client.account.messages.create(
        :from => from,
        :to => invitation.phone_number,
        :body => "Hey #{invitation.full_name}, We're going out for food. Fill out this form: http://restaurant-roullete.heroku.com/events/143"
      )
      puts "Sent invitation message to invitee: #{invitation.full_name}"
    end

    # send message to planner
    client.account.messages.create(
      :from => from,
      :to => event.planner.phone_number,
      :body => "Hey #{event.planner.full_name}, We're going out for food. Fill out this form: http://restaurant-roullete.heroku.com/events/143"
    )
    puts "Sent invitation message to planner: #{event.planner.full_name}"
  end

  def send_final_selection_to_planner(event)
    p "in send_final_selection_to_planner "

    account_sid = "AC6882f6d03c767dfed68ddd6e61554b76"
    auth_token = "b6c51acfab9f2d0ceefee450d074cc2c"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+15105008394" # Your Twilio number

    # send message to planner
    client.account.messages.create(
      :from => from,
      :to => event.planner.phone_number,
      :body => "Selected restaurant: #{event.selected_restaurant}"
    )
    puts "Sent final selection message to planner: #{event.planner.full_name}"
  end


end
