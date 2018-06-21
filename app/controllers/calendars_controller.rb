class CalendarsController < ApplicationController
  def index
    @meetings = Event.where(user: current_user)
  end
end
