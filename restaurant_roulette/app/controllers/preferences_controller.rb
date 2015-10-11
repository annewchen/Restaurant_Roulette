class PreferencesController < ApplicationController
  def index
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)
    other_params
    values = [@preference.price, @preference.cuisine, @preference.good_for_groups , @preference.vegetarian, @preference.distance]

    filter_count = 0

    values.each do |value|
      if value != "" && value != nil
        filter_count+=1
      end
    end

    if filter_count <= 2 && @preference.save
        render "thank"
    else
        p "******************"
        flash[:notice] = "You can only pick 2 filters"
        p "******************"
        render "index"
    end
  end

  private
    def preference_params
      params.require(:preference).permit(:price, :cuisine, :distance)
    end

    def other_params
      @preference.participant_id = current_user.id
      @preference.event_id = params[:event_id]
      @preference.good_for_groups = params[:good_for_groups]
      @preference.vegetarian = params[:vegetarian]
    end
end
