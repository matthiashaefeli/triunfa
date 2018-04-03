class Group < ApplicationRecord
    validates :name, presence: true
    validates :key, presence: true

    belongs_to :course
    belongs_to :teacher
    has_many :students
end
