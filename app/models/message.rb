class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :candidate

  validates_presence_of :body, :conversation_id, :candidate_id
end
