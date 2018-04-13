class TablesController < ApplicationController

    def create
        if !table_exists(params[:format].split("/")[0],params[:format].split("/")[1])
            user = User.find(params[:format].split("/")[0])
            table = Table.create(user: user, seconduser: params[:format].split("/")[1])
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
