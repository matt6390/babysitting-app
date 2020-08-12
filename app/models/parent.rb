class Parent < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /@/, message: "Must be a valid email address"}
  validates :phone_number, presence: true

  has_many :kids

  has_one :location

  has_many :parent_reviews
  has_many :reviews, through: :parent_reviews

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
