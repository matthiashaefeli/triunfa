# frozen_string_literal: true

class CalendarsController < ApplicationController
  before_action :logged_in
  def index
    @event = Event.new
    @event.start_time = Time.now
    @meetings = Event.where(user: current_user)
  end
end
