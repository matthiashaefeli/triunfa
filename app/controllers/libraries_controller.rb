# frozen_string_literal: true

class LibrariesController < ApplicationController
  before_action :logged_in
  before_action :user_has_direction, only: [:index]
  def index
    @folders = Folder.where(admin: false)
    @adminfolders = Folder.where(admin: true)
    @papers = Paper.all
  end
end
