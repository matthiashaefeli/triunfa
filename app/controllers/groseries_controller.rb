# frozen_string_literal: true

class GroseriesController < ApplicationController
  before_action :logged_in
  def index
    @groseries = Grosery.where(user: current_user)
  end

  def create
    @grosery = Grosery.create(grosery_params)
    @grosery.user = current_user
    @grosery.save
    if request.xhr?
      respond_to do |format|
        format.html { render partial: "groseries/grosery", layout: false }
      end
    else
      redirect_to groseries_index_path
    end
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
