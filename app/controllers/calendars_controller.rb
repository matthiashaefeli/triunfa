class CalendarsController < ApplicationController
  def index
    @meetings = Event.all
  end
end
