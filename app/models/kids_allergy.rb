class KidsAllergy < ApplicationRecord
  validates :kid_id, presence: true
  validates :allergy_id, presence: true

  belongs_to :kid
  belongs_to :allergy

  def friendly_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def friendly_updated_at
    updated_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
