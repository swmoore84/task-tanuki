class User < ApplicationRecord
  has_one_attached :photo
  has_many :tasks, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :offers_as_owner, through: :tasks, source: :offers
  # validates :username, presence: true
  validates :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def pending_tasks
    tasks.joins(:offers).where(offers: { status: "pending" }).distinct
  end

  def pending_tasks?
    pending_tasks.any?
  end

  def tasks_without_offers
    tasks.where('id NOT IN (SELECT DISTINCT(task_id) FROM offers)')
  end
end
