# frozen_string_literal: true

class Paper < ApplicationRecord
  belongs_to :folder

  validates :name, presence: true
  validates :link, presence: true, unless: ->(paper) { paper.document.present? }

  has_attached_file :document,
                  storage: :fog,
                  fog_credentials: {
                  provider: "AWS",
                  aws_access_key_id: ENV["aws_key"],
                  aws_secret_access_key: ENV["aws_secret_key"]
                  },
                  fog_directory: ENV["aws_library"]

  validates_attachment_file_name :document, matches: [/\.xls?$/,
                                                      /\.xlsx?$/,
                                                      /\.csv?$/,
                                                      /\.pdf?$/,
                                                      /\.png?$/,
                                                      /\.jpg?$/,
                                                      /\.jpeg?$/,
                                                      /\.docx?$/,
                                                      /\.pptx?$/,
                                                      /\.pptm?$/]

  process_in_background :document
end
