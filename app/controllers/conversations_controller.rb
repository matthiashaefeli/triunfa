class ConversationsController < ApplicationController

    def create 
        table = Table.find(params[:table])
        conver = Conversation.create(user: current_user, table: table, body: params[:conversation][:body])
        ActionCable.server.broadcast 'conversation_channel',
                                             content:  conver.body,
                                             table: table.id

    end

end
