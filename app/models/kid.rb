class Kid < ApplicationRecord
  validates :first_name, presence: true
  validates :age, presence: true

  belongs_to :parent

  has_many :kids_medications
  has_many :medications, through: :kids_medications

  def friendly_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def friendly_updated_at
    updated_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end