class TalksController < ApplicationController
  def create
    talk = Talk.new(talk_params)
    talk.user = current_user 
    talk.save
    ActionCable.server.broadcast 'talk_channel',
                                content: render_talk(talk)
  end

  def destroy
    talk = Talk.find(params[:id])
    talk.comments.delete_all
    talk.likes.delete_all
    id = '#talk-to-delete-id'+talk.id.to_s
    talk.delete
    ActionCable.server.broadcast 'room_channel',
                                delete: id
  end

  private
  def talk_params
    params.require(:talk).permit(:body, :avatar, :link)
  end

  def render_talk(talk)
    ApplicationController.render(partial: 'talks/talk_comments', locals: { forum: talk, chat: talk.id, t: talk})
  end
end
