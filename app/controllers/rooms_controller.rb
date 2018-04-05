class RoomsController < ApplicationController
    def index
    end

    def show
        @room = Room.find(params[:id])
        @messages = Message.where(room: @room).order(created_at: :desc)
    end

end
