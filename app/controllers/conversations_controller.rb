
class ConversationsController < ApplicationController

    def create 
        table = Table.find(params[:table])
        conver = Conversation.create(user: current_user, table: table, body: params[:conversation][:body])
        ActionCable.server.broadcast 'conversation_channel',
                                             content:  conver.body,
                                             table: table.id

    end

    def destroy
        table = Table.find(params[:id])
        table.conversations.each do |c|
            c.delete
        end
        table.delete
        if request.xhr?
            respond_to do |format|
                format.html {}
                format.json {}
            end
        else
            redirect_to root_path
        end
    end

end
