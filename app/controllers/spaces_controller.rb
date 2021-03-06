# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action :logged_in

  def index
    @spaces = Space.all
  end

  def create
    @space = Space.new(space_params)
    @space.save
    if request.xhr?
      respond_to do |format|
        format.html { render partial: "spaces/link", layout: false }
      end
    else
      redirect_to spaces_path
    end
  end

  def show
    @space = Space.find(params[:id])
    if params[:limit] != nil
      @publications_limit = params[:limit]
    else
      @publications_limit = 5
    end
    @flyers = Flyer.all
    @comments = Comment.order(created_at: :desc)
    @links = Link.all
    @publications = (Publication.where(space_id: @space.id)).order(created_at: :desc).limit(@publications_limit)
  end

  def destroy
    space = Space.find(params[:id])
    space.publications.each do |p|
      p.comments.delete_all
      p.likes.delete_all
    end
    space.publications.delete_all
    space.destroy
    redirect_to spaces_path
  end

  private

    def space_params
      params.require(:space).permit(:name)
    end
end
