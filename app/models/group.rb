class Group < ApplicationRecord
    validates :name, presence: true
    validates :activ, presence: true
    validates :key, presence: true

    belongs_to :cours
end
