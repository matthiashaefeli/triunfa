
class ConversationsController < ApplicationController

    def create 
        table = Table.find(params[:table])
        conver = Conversation.create(user: current_user, table: table, body: params[:conversation][:body])
        if table.user == current_user
            content_class = "first_user"
            other_user = User.find(table.seconduser)
            message_id = other_user.id
            user_writer = User.find(table.user.id)
        else
            content_class = "second_user"
            other_user = User.find(table.user.id)
            message_id = other_user.id
            user_writer = User.find(table.seconduser)
        end
        
        ActionCable.server.broadcast 'conversation_channel',
                                             content:  conver.body,
                                             table: table.id,
                                             content_class: content_class,
                                             message: message_id,
                                             writer: user_writer.id
    end

    def destroy
        table = Table.find(params[:id])
        if table.user == current_user
            user_writer = User.find(table.user.id)
        else 
            user_writer = User.find(table.seconduser)
        end
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
                                            remove: id,
                                            writer: user_writer.id
        else
            redirect_to root_path
        end
    end

end
