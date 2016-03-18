class SessionsController < ApplicationController
  def new
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out."
    redirect_to root_path
  end
end
