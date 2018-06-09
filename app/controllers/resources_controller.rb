class ResourcesController < ApplicationController
  include ServiceUser
  before_action :is_admin
  def index
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
    params.require(:resource).permit(:link, :avatar)
  end

end