class Event < ApplicationRecord

  validates :start_time, presence: true
  validates :name, presence: true
end
