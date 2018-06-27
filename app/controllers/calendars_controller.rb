# frozen_string_literal: true

class CalendarsController < ApplicationController
  include ServiceUser
  before_action :logged_in
  def index
    @meetings = Event.where(user: current_user)
  end
end
