require 'twilio-ruby'

class TextMessagesController < ApplicationController
  def index
    p "*" * 20
    p "In text_messages index"
    p "*" * 20
    @twilioVersionMsg = 'Hello World! Currently running version ' + Twilio::VERSION + \
        ' of the twilio-ruby library.'
    p "twilio message: #{@twilioVersionMsg}"
  end
end
