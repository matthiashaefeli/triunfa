class Event < ApplicationRecord

  validates :start_time, presence: true
  validates :name, presence: true
  belongs_to :user
end
