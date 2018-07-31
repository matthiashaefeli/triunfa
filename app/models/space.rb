# frozen_string_literal: true

class Space < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :publications
end
