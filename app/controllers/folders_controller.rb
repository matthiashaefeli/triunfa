# frozen_string_literal: true

class FoldersController < ApplicationController
  def create
    folder = Folder.new(name: params[:folder][:name])
    if folder.save
      redirect_to libraries_path
    else
      redirect_to libraries_path, alert: folder.errors.full_messages
    end
  end

  def destroy
    Folder.find(params[:id]).destroy
    redirect_to libraries_path
  end
end
