class SessionsController < ApplicationController
  def create
    binding.pry
    if user = User.find_or_create_from_auth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
