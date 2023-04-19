class AdminController < ApplicationController

    before_action :admin

    def ban_user

        user = User.find_by(email: params[:email])

        if !user
            render json: {message: "User not found"}, status: :not_found
            return
        end

        user.banned = true
        user.save

        render json: {message: "User banned"}, status: :ok

    end




    def unban_user
        
        user = User.find_by(email: params[:email])

        if !user
            render json: {message: "User not found"}, status: :not_found
            return
        end

        user.banned = false
        user.save

        render json: {message: "User unbanned"}, status: :ok

    end

    def reports
        reports = Report.all
        render json: reports, status: :ok
    end

    def view_chatrooms
        chatrooms = Chatrooms.all
        render json: chatrooms
    end

    private

    def admin?
        current_user.admin?
    end


end
