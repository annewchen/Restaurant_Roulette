
class WelcomeController < ApplicationController
  def index


    session[:user_id] = current_user.id
    @user = User.find_by(id: session[:user_id])

    p "*" * 20
    p  current_user.id
    p session[:user_id]
  end
end
