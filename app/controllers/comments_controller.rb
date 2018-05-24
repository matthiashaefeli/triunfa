class CommentsController < ApplicationController

    def create 
        if params[:chat]
            message = Chat.find(params[:chat])
        elsif params[:message]
            message = Message.find(params[:message])
        elsif params[:talk]
            message = Talk.find(params[:talk])
        end
        co = Comment.create(text: params[:comment][:text],user: current_user)
        co.update_attribute(:commentable, message)
        redirect_to root_path
    end
end

