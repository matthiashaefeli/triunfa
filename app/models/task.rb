class Task < ApplicationRecord

    validates :body, presence: true
    validates :user, presence: true
    validates :group, presence: true
    validates :end, presence: true

    belongs_to :user
    belongs_to :group
end
