class Table < ApplicationRecord
	has_many :conversations
  belongs_to :user
  
  validates :user, presence: true
  validates :seconduser, presence: true
end
