class Conversation < ActiveRecord::Base
	belongs_to :sender, :foreign_key => :sender_id, class_name: Candidate
	belongs_to :recipient, :foreign_key => :recipient_id, class_name: Candidate
	has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  def self.involving(candidate)
    where("conversations.sender_id =? OR conversations.recipient_id =?",candidate.id,candidate.id)
  end

  def self.between(sender_id,recipient_id)
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
   end
end
