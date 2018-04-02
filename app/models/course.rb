class Course < ApplicationRecord
    validates :name, presence: true
    validates :start, presence: true 
    validates :end, presence: true

    has_many :groups
end
