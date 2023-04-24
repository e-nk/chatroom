class MessageController < ApplicationController
  before_action :set_chatroom
  before_action :set_message, only: [:edit, :update, :destroy, :reply]
  before_action :banned

  # def create
  #   message = Message.new(message_params)

  #   if @current_user.banned
  #     render json: { message: "You are banned!"}
  #     return
  #   end
    
  #   message.chatroom = @chatroom
  #   message.user = @current_user

  #   if !message.save
  #     render json: {message: message.errors.full_messages}
  #     return
  #   end
  #   render json: {message: message,user: @current_user}, status: :created
  # end
  def create
    message = Message.new(message_params)
    
    if @current_user.banned
      render json: { message: "You are banned!"}
      return
    end
    
    message.chatroom = @chatroom
    message.user = @current_user
    
    if params[:images]
      params[:images].each do |image|
        message.images.attach(image)
      end
    end
    
    if !message.save
      render json: { message: message.errors.full_messages }
      return
    end
    
    render json: { message: message, user: @current_user }, status: :created
  end
  

  def edit
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @chatroom, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to @chatroom, notice: 'Message was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def reply
    @reply_message = @chatroom.messages.new(message_params)
    @reply_message.user = @current_user
    @reply_message.parent_message_id = @message.id

    respond_to do |format|
      if @reply_message.save
        format.html { redirect_to @chatroom, notice: 'Message was successfully replied.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { redirect_to @chatroom, alert: 'Error creating message.' }
        format.json { render json: @reply_message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def set_message
    @message = @chatroom.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :image)
  end
end
