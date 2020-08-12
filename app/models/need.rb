class Need < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :kids_needs
  has_many :kids, through: :kids_needs

  def friendly_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def friendly_updated_at
    updated_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
