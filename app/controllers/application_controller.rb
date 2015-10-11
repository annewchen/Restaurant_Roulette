class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

      def configure_permitted_parameters
          devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:full_name, :phone_number, :email, :password) }
          devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :full_name, :phone_number, :email, :password) }
          devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:full_name, :phone_number, :email, :password, :current_password) }
      end

  protect_from_forgery with: :exception
  before_action :authenticate_user!
end