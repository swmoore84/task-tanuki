class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :status, inclusion: { in: %w[pending active complete] }
  validates :user, uniqueness: { scope: :task, message: 'only one offer allowed per task' }
end
