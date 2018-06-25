# frozen_string_literal: true

class ResourcesController < ApplicationController
  include ServiceUser
  before_action :is_admin
  def index
    @sentence = Sentence.first
    @links = Link.all
    @resources = Resource.all
  end

  def create
    res = Resource.create(resources_params)
    redirect_to resources_path
  end

  def destroy
    res = Resource.find(params[:id])
    res.delete
    redirect_to resources_path
  end

  private

    def resources_params
      params.require(:resource).permit(:link, :avatar, :name)
    end
end
