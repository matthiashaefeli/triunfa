class Space < ApplicationRecord
  validates :name, uniqueness: true
  has_many :publications
end
