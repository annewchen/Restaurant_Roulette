module TextMessagesHelper
  def TextMessagesHelper.send_text_messages_to_invitees_and_planner(event)
    p "in send_text_messages_to_invitees_and_planner "

    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']


    from = ENV['TWILIO_PHONE_NUMBER'] # Your Twilio number

    # send message to invitees
    event.invitations.each do |invitation|
      client.account.messages.create(
        :from => from,
        :to => invitation.phone_number,
        :body => "Hey #{invitation.full_name}, yo I'm hangry. Let's grub. Fill out this form asap: http://#{ENV['HOME_URL']}.herokuapp.com/events/#{event.id}/preferences"
      )
      puts "Sent invitation message to invitee: #{invitation.full_name}"
    end

    # send message to planner
    client.account.messages.create(
      :from => from,
      :to => event.planner.phone_number,
      :body => "Hey #{event.planner.full_name}, yo I'm hangry. Let's grub. Fill out this form asap: http://#{ENV['HOME_URL']}.herokuapp.com/events/#{event.id}/preferences"
    )
    puts "Sent invitation message to planner: #{event.planner.full_name}"
  end

  def TextMessagesHelper.send_final_selection_to_planner(event)
    p "in send_final_selection_to_planner "

    p "account sid env: #{ENV['TWILIO_ACCOUNT_SID']}"


    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    p "SELECTED REST: #{event.selected_restaurant_name}"
    from = ENV['TWILIO_PHONE_NUMBER'] # Your Twilio number
    # send message to invitees
    event.invitations.each do |invitation|
      client.account.messages.create(
        :from => from,
        :to => invitation.phone_number,
        :body => "Yo! You're eating at: #{event.selected_restaurant_name} located at #{event.selected_restaurant_address}. Call them at #{event.selected_restaurant_phone_number}"
      )
      puts "Sent invitation message to invitee: #{invitation.full_name}"
    end



    client.account.messages.create(
      :from => from,
      :to => event.planner.phone_number,
      :body => "Yo! You're eating at: #{event.selected_restaurant_name} located at #{event.selected_restaurant_address}. Call them at #{event.selected_restaurant_phone_number}"
    )
    puts "Sent final selection message to planner: #{event.planner.full_name}"
  end


  def TextMessagesHelper.send_no_results_message(event)
    p "in send_no_results_to_planner "

    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    from = ENV['TWILIO_PHONE_NUMBER'] # Your Twilio number

    # send message to invitees
    event.invitations.each do |invitation|
      client.account.messages.create(
        :from => from,
        :to => invitation.phone_number,
        :body => "Sorry, no selected restaurants were found based on your preferences. Please try again!"
      )
      puts "Sent invitation message to invitee: #{invitation.full_name}"
    end

    client.account.messages.create(
      :from => from,
      :to => event.planner.phone_number,
      :body => "Sorry, no selected restaurants were found based on your preferences. Please try again!"
    )
    puts "Sent no results message to planner: #{event.planner.full_name}"
  end
end


