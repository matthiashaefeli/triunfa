module ServiceLike
    def get_model(model_string)
        if model_string == "Chat"
            return Chat
        elsif model_string == "Message"
            return Message
        elsif model_string == "Talk"
            return Talk
        elsif model_string == "Publication"
          return Publication
        end
    end
end