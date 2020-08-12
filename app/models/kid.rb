class Kid < ApplicationRecord
  validates :first_name, presence: true
  validates :age, presence: true

  belongs_to :parent

  has_many :kids_medications
  has_many :medications, through: :kids_medications

  has_many :kids_allergies
  has_many :allergies, through: :kids_allergies

  has_many :kids_needs
  has_many :needs, through: :kids_needs

  def friendly_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def friendly_updated_at
    updated_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
