class Task < ApplicationRecord

    # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    # has_attached_file :document, styles: { thumbnail: "60x60#" }
    # validates_attachment :document, content_type: { content_type: "application/pdf" }

    has_attached_file :document
    validates_attachment_file_name :document, matches: [/\.xls?$/, /\.xlsx?$/, /\.csv?$/, /\.pdf?$/]

    validates :body, presence: true
    validates :user, presence: true
    validates :group, presence: true
    validates :end, presence: true

    belongs_to :user
    belongs_to :group
end
