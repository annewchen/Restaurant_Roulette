module TextMessagesHelper
  def TextMessagesHelper.send_text_messages_to_invitees_and_planner(event)
    p "in send_text_messages_to_invitees_and_planner "

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

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

  def TextMessagesHelper.send_final_selection_to_planner(event)
    p "in send_final_selection_to_planner "

    p "account sid env: #{ENV['TWILIO_ACCOUNT_SID']}"

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+15105008394" # Your Twilio number

    client.account.messages.create(
      :from => from,
      :to => event.planner.phone_number,
      :body => "Selected restaurant: #{event.selected_restaurant}"
    )
    puts "Sent final selection message to planner: #{event.planner.full_name}"
  end
end


