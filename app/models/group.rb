class Group < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  has_many :students
  has_many :tasks

  validates :name, presence: true
  validates :key, presence: true
  validates :teacher, presence: true
  validates :course, presence: true
  validates :key, uniqueness: true
end
