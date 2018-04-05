class Course < ApplicationRecord

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    
    validates :name, presence: true
    validates :start, presence: true 
    validates :end, presence: true

    has_many :groups
end
