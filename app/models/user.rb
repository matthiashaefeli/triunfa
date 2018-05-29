class User < ApplicationRecord
  has_attached_file :avatar,
                    :storage => :fog,
                    :fog_credentials => {
                    provider: "AWS",
                    aws_access_key_id: ENV["aws_key"],
                    aws_secret_access_key: ENV["aws_secret_key"]
                    },
                    :fog_directory => ENV["aws_library"],
                    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes

  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  # validates :password, numericality: { only_integer: true }

  has_many :teachers
  has_many :admins
  has_many :students
  has_many :messages
  has_many :chats
  has_many :igroups
  has_many :tables
  has_many :conversations
  has_many :talks
  has_many :finishedAssignments
  has_many :comments
  has_many :likes

  devise :database_authenticatable, :validatable, password_length: 4..4
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
end
