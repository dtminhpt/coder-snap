class MessagesController < ApplicationController
  before_action :require_login

  
  def new
    @message = current_user.sent_messages.new
  end

  def create
  end

  def index
    @messages = current_user.received_messages.order(created_at: :desc)
  end

  def show
  end

  def sent
  end
end
