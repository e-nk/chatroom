# class ChatroomController < ApplicationController
#     def index
#       chatrooms = @current_user.chatrooms
#       render json: chatrooms
#     end
  
#     def show
#       chatroom = @current_user.chatrooms.find_by(id: params[:id])
#       if chatroom
#         render json: chatroom
#       else
#         render json: { error: "Chatroom not found" }, status: :not_found
#       end
#     end
  
#     def create

#       if @current_user.banned
#         render json: { message: "You are banned!"}
#         return
#       end

#       chatroom = Chatroom.new(chatroom_params)
#       chatroom.user = @current_user
  
#       if chatroom.save
#         render json: chatroom, status: :created
#       else
#         render json: { errors: chatroom.errors.full_messages }, status: :unprocessable_entity
#       end
#     end
  
#     def update
#       if @current_user.banned
#         render json: { message: "You are banned!"}
#         return
#       end
#       chatroom = @current_user.chatrooms.find_by(id: params[:id])
#       if chatroom
#         if chatroom.update(chatroom_params)
#           render json: chatroom, status: :ok
#         else
#           render json: { error: chatroom.errors.full_messages }, status: :unprocessable_entity
#         end
#       else
#         render json: { error: "Chatroom not found" }, status: :not_found
#       end
#     end
  
#     private
  
#     def chatroom_params
#       params.permit(:name, :description)
#     end
#   end


class ChatroomController < ApplicationController
  def index
    chatrooms = @current_user.chatrooms
    render json: chatrooms
  end

  def show
    chatroom = @current_user.chatrooms.find_by(id: params[:id])

    chatrooms_count = @current_user.chatrooms.count.to_i

    if chatrooms_count == 5
      render json: { message: "You have reached maximum number of chatrooms."}, status: :unauthorized
      return
    end

    if chatroom
      render json: chatroom
    else
      render json: { error: "Chatroom not found" }, status: :not_found
    end
  end

  def create
    if @current_user.banned
      render json: { message: "You are banned!"}
      return
    end

    chatroom = Chatroom.new(chatroom_params)
    chatroom.user = @current_user

    if chatroom.save
      render json: chatroom, status: :created
    else
      render json: { errors: chatroom.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def update
    if @current_user.banned
      render json: { message: "You are banned!"}
      return
    end
    chatroom = @current_user.chatrooms.find_by(id: params[:id])
    if chatroom
      if chatroom.update(chatroom_params)
        render json: chatroom, status: :ok
      else
        render json: { error: chatroom.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Chatroom not found" }, status: :not_found
    end
  end

  def destroy
    if @current_user.banned
      render json: { message: "You are banned!"}
      return
    end
    chatroom = @current_user.chatrooms.find_by(id: params[:id])
    if chatroom
      chatroom.destroy
      render json: { message: "Chatroom deleted" }, status: :ok
    else
      render json: { error: "Chatroom not found" }, status: :not_found
    end
  end

  private

  def chatroom_params
    params.permit(:name, :description)
  end
end


