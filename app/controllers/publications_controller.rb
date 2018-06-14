class PublicationsController < ApplicationController
  def index
    if params[:limit] != nil
      @publications_limit = params[:limit]
    else
      @publications_limit = 5
    end
    @comments = Comment.order(created_at: :desc)
    @links = Link.all
    @publications = Publication.order(created_at: :desc).limit(@publications_limit)
  end

  def create
    publication = Publication.new(publication_params)
    publication.user = current_user 
    if publication.save
      if publication.avatar_file_name == nil
        imageUrl = ""
      else
        imageUrl = publication.avatar.url(:medium)
      end
      ActionCable.server.broadcast 'publication_channel',
                                  content: render_publication(publication)
    end
  end

  private

  def publication_params
    params.require(:publication).permit(:body, :avatar)
  end

  def render_publication(publication)
    ApplicationController.render(partial: 'publications/publication_comments', 
                                locals: { forum: publication, chat: publication.id, p: publication})
  end

end