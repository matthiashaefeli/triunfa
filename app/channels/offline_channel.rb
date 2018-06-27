# frozen_string_literal: true

class OfflineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "offline_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
