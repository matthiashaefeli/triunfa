class GroseriesController < ApplicationController
  def index
    @groseries = Grosery.all
  end

  def create
    grosery = Grosery.create(grosery_params)
    redirect_to groseries_index_path
  end

  def update
    if request.xhr?
      grosery = Grosery.find(params[:id])
      grosery.done = false
      grosery.save
    end
  end

  def destroy
    grosery = Grosery.find(params[:id])
    grosery.delete
  end

  private

  def grosery_params
    params.require(:grosery).permit(:name)
  end

end
