module MessagesHelper
  def self_or_other(message)
    message.candidate == current_candidate ? "self" : "other"
  end

  def message_interlocutor(message)
    message.candidate == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end
end
