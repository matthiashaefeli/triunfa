class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :name, presence: true
  validates :lastname, presence: true
  # validates :group, presence: true

  # belongs_to :group

  devise :database_authenticatable, :validatable, password_length: 4..4
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
