class Conversation < ApplicationRecord

    validates :body, presence: true
    validates :user_id, presence: true
    validates :table_id, presence: true

    belongs_to :user
    belongs_to :table

end
