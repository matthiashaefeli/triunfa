class Room < ApplicationRecord
  belongs_to :group
  has_many :messages  
end
