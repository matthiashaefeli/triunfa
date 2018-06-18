class Assignment < ApplicationRecord
  belongs_to :course
  validates :name, presence: true
  validates :points, presence: true
end
