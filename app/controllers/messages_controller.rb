class MessagesController < ApplicationController
  before_action :require_login

  
  def new
    @message = current_user.sent_messages.new
  end

  
  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to sent_messages_path, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def index
    @messages = current_user.received_messages.order(created_at: :desc)
  end

  def show
  end

  def sent
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:sender_id, :recipient_id, :content, :read_at)
    end
end
