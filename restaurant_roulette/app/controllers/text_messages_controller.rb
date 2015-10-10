require 'twilio-ruby'

class TextMessagesController < ApplicationController
  def index
    p "*" * 20
    p "In text_messages index"
    p "*" * 20
    @twilioVersionMsg = 'Hello World! Currently running version ' + Twilio::VERSION + \
        ' of the twilio-ruby library.'
    p "twilio message: #{@twilioVersionMsg}"

    account_sid = "AC6882f6d03c767dfed68ddd6e61554b76"
    auth_token = "b6c51acfab9f2d0ceefee450d074cc2c"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+15105008394" # Your Twilio number

    friends = {
    "+19097628390" => "Anne",
    "+15103043300" => "Utsab",
    "+16508787883" => "Gabby",
    "+14085134453" => "Priyanka"
    }

    friends.each do |key, value|
      client.account.messages.create(
        :from => from,
        :to => key,
        :body => "Hey #{value}, We're going out for food. Fill out this form: http://restaurant-roullete.heroku.com/events/143"
      )
      puts "Sent message to #{value}"
    end
  end
end
