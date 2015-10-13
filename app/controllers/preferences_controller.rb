require "yelp_helper"

class PreferencesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :create]

  def index
    @event = Event.find_by(id: params[:event_id])
  end

  def new
    @preference = Preference.new
  end

  def create
    p "*" * 20
    p "In create"
    @event = Event.find_by(id: params[:event_id])
    p "At A"
    @preference = Preference.new(preference_params)
    p "At B"
    @preference.event_id = params[:event_id]

    p "At C"
    if @preference.cuisine == ""
      @preference.cuisine = nil
    end

    p "At D"
    if @preference.distance != nil
      meter_conversion(@preference.distance)
    end

    values = [@preference.is_fancy, @preference.cuisine, @preference.is_vegetarian, @preference.distance]
    filter_count = 0
    values.each do |value|
      if value != nil
        filter_count+=1
      end
    end

    p "At E"
    if filter_count <= 2 && @preference.save
        p "At F"
        render "thank"
    else
        flash[:filter] = "You can only pick 2 filters"
        render "index"
    end

 # TODO:: CHANGE BACK TO ==
    if @event.preferences.count == (@event.invitations.count + 1)
      decision_algorithm(@event)
    end
  end

  private
    def preference_params
      params.require(:preference).permit(:is_fancy, :cuisine, :distance, :is_vegetarian)
    end

    def meter_conversion(miles)
      @preference.distance = miles * 1609.34
    end

    def decision_algorithm(event)
      all_choices = {
        is_fancy: [],
        cuisine: [],
        distance: [],
        is_vegetarian: []
      }


      #  Each "preference" is a hash of the user's selections, e.g.
      #  {
      #    "is_fancy" => true,
      #    "cuisine" => "indian",
      #    "distance" => 1000,
      #    "is_vegetarian" => true,
      #   }
      #
      # For a given choice (e.g. "cuisine"), collect
      # all users' choices for cuisine and put them all
      # in an array, specifically in all_choices["cuisine"]
      #
      event.preferences.each do |preference|

        #iterate over all possible choices ("is_fancy", "cuisine", etc.)
        all_choices.each do |choice, answers|
          if preference[choice] != nil
            answers << preference[choice]
          end
        end
      end

      # choosing one value for each choice and overwriting the hash
      # before: all_choices[is_fancy] = [true, true, false]
      # after: all_choices[is_fancy] = true
      all_choices.each do |choice, answers|
        all_choices[choice] = answers.sample
      end

      p "all choices: #{all_choices}"
      all_choices
      selected_restaurant_hash = YelpHelper.ping_yelp(all_choices[:is_fancy], all_choices[:cuisine], all_choices[:distance], all_choices[:is_vegetarian], event.street_address)

      if selected_restaurant_hash
        event.selected_restaurant_name = selected_restaurant_hash["name"]
        event.selected_restaurant_address = selected_restaurant_hash["address"]
        event.selected_restaurant_phone_number = selected_restaurant_hash["phone"]
        event.save
        TextMessagesHelper.send_final_selection_to_planner(event)
      else
        TextMessagesHelper.send_no_results_message(event)
      end


      p "selected restaurant: #{selected_restaurant_hash}"

    end

end
