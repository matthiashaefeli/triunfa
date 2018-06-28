# frozen_string_literal: true

class Grosery < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end
