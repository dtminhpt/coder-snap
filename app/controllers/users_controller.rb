class UsersController < ApplicationController
  before_action :require_login, only: [:add_friend]

  def new
      @user = User.new
  end 

  
  def index
    @users = User.all
    @friends = current_user.friends
    @blocked_users = current_user.blocked_users 
  end

  def add_friend
    Friendship.create(user_id: current_user.id, friend_id: params[:friend_id])
    redirect_to users_path
  end

  def remove_friend
      friend = User.find(params[:friend_id])
      current_user.friends.delete(friend)
      redirect_to users_path
  end 

  def block
      Block.create(user_id: current_user.id, blocked_id: params[:id])
      redirect_to users_path
  end 

  def unblock
      user = User.find(params[:id])
      current_user.blocked_users.delete(user)
      redirect_to users_path
  end 

  def create
      @user = User.create user_params
      if @user.persisted?
        session[:user_id] = @user.id
        flash[:success] = "Registered successfully."
        redirect_to root_path
      else
        flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
        render 'new'
      end
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
