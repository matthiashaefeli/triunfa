class User < ApplicationRecord

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :name, presence: true
  validates :lastname, presence: true
  # validates :password, numericality: { only_integer: true }

  has_many :teachers
  has_many :admins
  has_many :students
  has_many :messages
  has_many :chats
  has_many :igroups
  has_many :tables
  has_many :conversations

  devise :database_authenticatable, :validatable, password_length: 4..4
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
end
