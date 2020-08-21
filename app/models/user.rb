class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /@/, message: "Must be a valid email address"}
  validates :zip, presence: true 
  validates :zip, numericality: true
  validates :max_kids, presence: true 


  has_many :babysitter_reviews
  has_many :reviews, through: :babysitter_reviews

  def full_name
    first_name + " " + last_name
  end

  def friendly_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def friendly_updated_at
    updated_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
