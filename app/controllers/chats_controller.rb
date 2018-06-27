# frozen_string_literal: true

class ChatsController < ApplicationController
  include ServiceUser
  before_action :logged_in

  def create
    chat = Chat.new(chat_params)
    chat.user = current_user
    chat.save
    ActionCable.server.broadcast "room_channel",
                              content: render_chat(chat)
  end

  def destroy
    chat = Chat.find(params[:id])
    chat.comments.delete_all
    chat.likes.delete_all
    id = "#chat-to-delete-id" + chat.id.to_s
    chat.delete
    ActionCable.server.broadcast "room_channel",
                                delete: id
  end

  private
    def chat_params
      params.require(:chat).permit(:body, :avatar, :link, :document)
    end

    def render_chat(chat)
      ApplicationController.render(partial: "chats/chat_comments", locals: { forum: chat, chat: chat.id, c: chat })
    end
end
