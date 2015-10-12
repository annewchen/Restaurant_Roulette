class PreferencesController < ApplicationController
  def index
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)
    other_params
    if @preference.cuisine == ""
      @preference.cuisine = nil
    end
    meter_conversion(@preference.distance)
    values = [@preference.is_fancy, @preference.cuisine, @preference.is_vegetarian, @preference.distance]

    filter_count = 0

    values.each do |value|
      if value != nil
        filter_count+=1
      end
    end
     p "************************"
     p values
    if filter_count <= 2 && @preference.save
        render "thank"
    else
        flash[:notice] = "You can only pick 2 filters"
        render "index"
    end
  end

  private
    def preference_params
      params.require(:preference).permit(:is_fancy, :cuisine, :distance, :is_vegetarian)
    end

    def other_params
      @preference.participant_id = current_user.id
      @preference.event_id = params[:event_id]
    end

    def meter_conversion(miles)
      @preference.distance = miles * 1609.34
    end
end
