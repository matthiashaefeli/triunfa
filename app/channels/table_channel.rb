class TableChannel < ApplicationCable::Channel
    def subscribed
      stream_from "table_channel"
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  end