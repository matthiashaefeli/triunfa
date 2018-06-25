# frozen_string_literal: true

class EventsController < ApplicationController
  include ServiceUser
  before_action :logged_in
  def create
    event = Event.create(event_params)
    event.user = current_user
    event.save
    redirect_to calendars_path
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    Event.find(params[:id]).delete
    redirect_to calendars_path
  end

  private

    def event_params
      params.require(:event).permit(:name, :start_time, :description)
    end
end
