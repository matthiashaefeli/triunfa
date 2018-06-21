class EventsController < ApplicationController
  def create
    event = Event.create(event_params)
    event.user = current_user
    event.save
    redirect_to calendars_path
  end

  def show
    @event = Event.find(params[:id])
  end

  private 

  def event_params
    params.require(:event).permit(:name, :start_time, :description)
  end

end
