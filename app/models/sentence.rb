# frozen_string_literal: true

class Sentence < ApplicationRecord
  validates :body, presence: true
end
