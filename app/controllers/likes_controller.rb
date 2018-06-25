# frozen_string_literal: true

class LikesController < ApplicationController
  include ServiceLike
  def create
    if request.xhr?
      likeable = get_model(params[:model]).find(params[:id])
      like = Like.create(user: current_user)
      like.update_attribute(:likeable, likeable)
    end
  end
end
