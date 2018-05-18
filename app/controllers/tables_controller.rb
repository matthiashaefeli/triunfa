class TablesController < ApplicationController

    def create
        u2 = params[:format]
        if !table_exists(current_user.id,u2)
            table = Table.create(user: current_user, seconduser: u2)
            ActionCable.server.broadcast 'table_channel',
                                        seconduser: u2,
                                        user: current_user.id

             redirect_to root_path                             

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
