# frozen_string_literal: true

class Igroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
