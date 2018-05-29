class TalksController < ApplicationController
  def create
    talk = Talk.new(talk_params)
    talk.user = current_user 
    if talk.save
      if talk.avatar_file_name == nil
        imageUrl = ""
      else
        imageUrl = talk.avatar.url(:medium)
      end
      name = "#{talk.user.name} #{talk.user.lastname}"
      ActionCable.server.broadcast 'talk_channel',
                                  content:  talk.body,
                                  name: name,
                                  created: talk.created_at,
                                  image: imageUrl
    end
  end

  private
  def talk_params
    params.require(:talk).permit(:body, :avatar)
  end
end
