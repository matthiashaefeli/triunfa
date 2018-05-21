
class ConversationsController < ApplicationController

    def create 
        table = Table.find(params[:table])
        conver = Conversation.create(user: current_user, table: table, body: params[:conversation][:body])
        if table.user == current_user
            content_class = "first_user"
            other_user = User.find(table.seconduser)
            message_id = other_user.id
        else
            content_class = "second_user"
            other_user = User.find(table.user.id)
            message_id = other_user.id
        end
        
        ActionCable.server.broadcast 'conversation_channel',
                                             content:  conver.body,
                                             table: table.id,
                                             content_class: content_class,
                                             message: message_id

    end

    def destroy
        table = Table.find(params[:id])
        id = table.id
        table.conversations.each do |conv|
            conv.delete
        end
        table.delete
        if request.xhr?
            respond_to do |format|
                format.html {}
                format.json {}
            end
            ActionCable.server.broadcast 'conversation_channel',
                                            remove: id
        else
            redirect_to root_path
        end
    end

end
