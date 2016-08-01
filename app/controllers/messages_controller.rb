class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_path, notice: "Your message has been created" and return
    end
    render 'new'
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    if @message.update_attributes(message_params)
      redirect_to messages_path, notice: "Your message has been updated" and return
    end

    render 'edit'
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to messages_path, notice: "Your message has been deleted" and return
  end

private
  def message_params
    params.require(:message).permit(:pusblished_at, :author, :message)
  end

end