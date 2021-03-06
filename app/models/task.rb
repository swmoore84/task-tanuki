class Task < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  validates :description, presence: true
  validates :price, presence: true
  validates :due_date, presence: true
  validates :title, presence: true
  validates :category, inclusion:
  { in: ["Education", "Housework", "Moving", "Other", "Photography", "Shopping", "Translation",
         "Local guides", "Experiences", "Health and Beauty", "Maintenance"] }

  has_one_attached :photo
end
