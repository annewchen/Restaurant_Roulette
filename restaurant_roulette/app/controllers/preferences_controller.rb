class PreferencesController < ApplicationController
  def index
  end

  def new
  end

  def create
    render plain: params[:preference].inspect

    @preference = Preference.new(params[:preference])

    @preference.save
  end
end
