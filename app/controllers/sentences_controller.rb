class SentencesController < ApplicationController
  include ServiceUser
  before_action :is_admin
  def create
    sentence = Sentence.create(sentence_params)
    redirect_to resources_path
  end

  def update
    sentence = Sentence.find(params[:id])
    sentence.update_attributes(sentence_params)
    sentence.save
    redirect_to resources_path
  end

  private 

  def sentence_params
    params.require(:sentence).permit(:title, :body)
  end

end
