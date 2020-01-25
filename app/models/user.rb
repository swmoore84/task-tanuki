class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :offers_as_owner, through: :tasks, source: :offers
  # validates :username, presence: true
  validates :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
