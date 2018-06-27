# frozen_string_literal: true

class LinksController < ApplicationController
  include ServiceUser
  before_action :is_admin
  def create
    link = Link.create(links_params)
    redirect_to resources_path
  end

  def destroy
    link = Link.find(params[:id])
    link.delete
    redirect_to resources_path
  end

  private

    def links_params
      params.require(:link).permit(:name, :link, :avatar)
    end
end
