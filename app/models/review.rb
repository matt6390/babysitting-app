class Review < ApplicationRecord
  validates :rating, presence: true
  validates :rating, numericality: true
  validates :text, presence: true

  has_many :babysitter_reviews
  has_many :users, through: :babysitter_reviews

  has_many :parent_reviews
  has_many :parents, through: :parent_reviews


  def friendly_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def friendly_updated_at
    updated_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
