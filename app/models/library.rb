class Library < ApplicationRecord

    # has_attached_file :document,
    # :storage => :google_drive,
    # :google_drive_credentials => "#{Rails.root}/config/google_drive.yml"

    has_many :folders

end
