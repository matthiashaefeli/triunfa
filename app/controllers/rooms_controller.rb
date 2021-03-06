# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :logged_in
  before_action :user_has_direction, only: [:show, :index]
  def index
    @teacher_rooms = Room.where(group: Group.where(teacher: Teacher.find_by(user: current_user))).where(group: Group.where(activ: true))
  end

  def show
    if params[:limit] != nil
      @room_limit = params[:limit]
    else
      @room_limit = 5
    end
    @flyers = Flyer.all
    @room = Room.find(params[:id])
    @messages = Message.where(room: @room).order(created_at: :desc).limit(@room_limit)
    @comments = Comment.order(created_at: :desc)
  end
end
