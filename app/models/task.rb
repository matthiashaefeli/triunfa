class Task < ApplicationRecord
  has_attached_file :document,
                    :storage => :fog,
                    :fog_credentials => {
                    provider: "AWS",
                    aws_access_key_id: ENV["aws_key"],
                    aws_secret_access_key: ENV["aws_secret_key"]
                    },
                    :fog_directory => ENV["aws_library"]

  validates_attachment_file_name :document, matches: [/\.xls?$/, 
                                                      /\.xlsx?$/, 
                                                      /\.csv?$/, 
                                                      /\.pdf?$/, 
                                                      /\.png?$/, 
                                                      /\.jpg?$/, 
                                                      /\.jpeg?$/,
                                                      /\.docx?$/]

  validates :body, presence: true
  validates :user, presence: true
  validates :group, presence: true
  validates :end, presence: true

  belongs_to :user
  belongs_to :group
end
