require 'twilio-ruby'
require 'text_messages_helper'

class TextMessagesController < ApplicationController
  def index
    p "*" * 20
    p "In text_messages index"
    p "*" * 20

    # TODO: currently hardcoding this to the first event in our database.
    # Remove this eventually when we integrate with the rest of the code flow.
    current_event = Event.find(1)
    # TextMessagesHelper.send_text_messages_to_invitees_and_planner(current_invite)
    TextMessagesHelper.send_final_selection_to_planner(current_event)

  end

end
