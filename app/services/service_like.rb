# frozen_string_literal: true

module ServiceLike
  def get_model(model_string)
    if model_string == "Chat"
      Chat
    elsif model_string == "Message"
      Message
    elsif model_string == "Talk"
      Talk
    elsif model_string == "Publication"
      Publication
    elsif model_string == "Task"
      Task
    end
  end
end
