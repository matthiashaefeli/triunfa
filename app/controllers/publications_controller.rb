# frozen_string_literal: true

class PublicationsController < ApplicationController
  before_action :logged_in
  before_action :expired
  def index
    if params[:limit] != nil
      @publications_limit = params[:limit]
    else
      @publications_limit = 5
    end
    @flyers = Flyer.all
    @comments = Comment.order(created_at: :desc)
    @links = Link.all
    @publications = Publication.order(created_at: :desc).limit(@publications_limit)
  end

  def create
    publication = Publication.new(publication_params)
    publication.user = current_user
    publication.save
    ActionCable.server.broadcast "publication_channel",
                                content: render_publication(publication)
  end

  def destroy
    publication = Publication.find(params[:id])
    publication.comments.delete_all
    publication.likes.delete_all
    id = "#publication-to-delete-id" + publication.id.to_s
    publication.delete
    ActionCable.server.broadcast "room_channel",
                                delete: id
  end

  private

    def publication_params
      params.require(:publication).permit(:body, :avatar, :link, :document)
    end

    def render_publication(publication)
      ApplicationController.render(partial: "publications/publication_comments",
                                  locals: { forum: publication, chat: publication.id, p: publication })
    end
end
