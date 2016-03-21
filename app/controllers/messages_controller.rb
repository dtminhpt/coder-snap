class MessagesController < ApplicationController
  before_action :require_login

  
  def new
    @message = current_user.sent_messages.new
  end

  
  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_sent_path, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def index
    @messages = current_user.received_messages.order(created_at: :desc)
  end

  
  # GET /messages/1
  def show
    @message = current_user.received_messages.find(params[:id])
    if @message.read_at
      redirect_to messages_path, notice: 'Message has been read before.'
    else
      @message.update_attribute(:read_at, Time.now)
    end
  end


  
  # GET /messages/sent
  def sent
    @messages = current_user.sent_messages.order(created_at: :desc)
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:sender_id, :recipient_id, :title, :body, :photo, :read_at)
    end
end
