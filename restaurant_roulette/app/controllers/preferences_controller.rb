class PreferencesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @preference = Preference.new(preference_params)
    @preference.participant_id = current_user.id
    @preference.event_id = params[:event_id]
    if @preference.save
      render "thank"
    end
  end

  private
    def preference_params
      params.require(:preference).permit(:price, :cuisine, :good_for_groups, :vegetarian, :distance)
    end
end
