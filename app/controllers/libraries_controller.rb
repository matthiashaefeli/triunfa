# frozen_string_literal: true

class LibrariesController < ApplicationController
  include ServiceUser
  before_action :logged_in
  before_action :user_has_direction, only: [:index]
  def index
    @folders = Folder.all
    @papers = Paper.all
  end
end
