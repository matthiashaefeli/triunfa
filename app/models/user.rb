class User < ApplicationRecord
  
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

  devise :database_authenticatable, :validatable, password_length: 4..4
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
end
