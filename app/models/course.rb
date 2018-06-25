# frozen_string_literal: true

class Course < ApplicationRecord
  has_attached_file :avatar,
                    storage: :fog,
                    fog_credentials: {
                    provider: "AWS",
                    aws_access_key_id: ENV["aws_key"],
                    aws_secret_access_key: ENV["aws_secret_key"]
                    },
                    fog_directory: ENV["aws_library"],
                    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

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
                                                      /\.jpg?$/]
  validates :name, presence: true
  # validates :startdate, presence: true
  # validates :enddate, presence: true

  has_many :groups
  has_many :assignments
end
