class Task < ApplicationRecord
  belongs_to :user
  has_many :offers
  validates :description, presence: true
  validates :price, presence: true
  validates :due_date, presence: true
end
