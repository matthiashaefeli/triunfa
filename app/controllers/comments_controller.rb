class CommentsController < ApplicationController
  def create 
    if params[:chat]
      message = Chat.find(params[:chat])
      id = "#chat#{message.id}"
    elsif params[:message]
      message = Message.find(params[:message])
      id = "#message#{message.id}"
    elsif params[:talk]
      message = Talk.find(params[:talk])
      id = "#talk#{message.id}"
    end
    co = Comment.create(text: params[:comment][:text],user: current_user)
    co.update_attribute(:commentable, message)

    ActionCable.server.broadcast 'talk_channel',
                                  chatcontent:  co.text,
                                  user: current_user.name,
                                  place: id,
                                  image: "",
                                  content: ""
                                      
  end
end

