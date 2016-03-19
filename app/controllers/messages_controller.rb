class MessagesController < ApplicationController
  def new
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
