class TablesController < ApplicationController

    def create
        u1 = params[:format].split("/")[0]
        u2 = params[:format].split("/")[1]
        if !table_exists(u1,u2)
            user = User.find(u1)
            table = Table.create(user: user, seconduser: u2)
            ActionCable.server.broadcast 'table_channel',
                                        user: u1

        else
            redirect_to root_path
        end
    end


    
    private

    def table_exists(u1, u2)
        if Table.find_by(user: User.find(u1), seconduser: u2)
            return true
        elsif Table.find_by(user: User.find(u2), seconduser: u1)
            return true
        end 
        return false
    end

end
