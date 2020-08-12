class BabysitterReview < ApplicationRecord
  validates :user_id, presence: true
  validates :user_id, numericality: true
  validates :review_id, presence: true
  validates :review_id, numericality: true

  belongs_to :user
  belongs_to :review

  def friendly_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def friendly_updated_at
    updated_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
