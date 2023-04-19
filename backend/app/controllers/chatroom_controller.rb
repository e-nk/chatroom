class ChatroomController < ApplicationController

    
    def index

        if !isBanned?

        else
            render json: {message: "You have been banned"}, status: :unauthorized
        end

    end

    def create

        chatrooms = current_user.chatroom.all.count
        
        if chatrooms < 5
            new_chatroom = Chatroom.create!(chatroom_params)
            render json: {message: "Created successfully"}, status: :ok
        else
            render json: {message: "Maximum number of chatrooms reached"}, status: :unauthorized
        end
    end

    private

    def chatroom_params
        params.permit(:name, :description)
    end

    def isBanned
        current_user.banned?
    end

 
end
