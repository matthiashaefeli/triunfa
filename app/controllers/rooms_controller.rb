class RoomsController < ApplicationController
    
    before_action :logged_in

    def index
    end

    def show
        @room = Room.find(params[:id])
        @messages = Message.where(room: @room).order(created_at: :desc)
    end

    def logged_in
        if !current_user
            redirect_to root_path
        end
    end

end
