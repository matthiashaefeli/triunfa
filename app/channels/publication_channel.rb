# frozen_string_literal: true

class PublicationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "publication_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
