class Location < ApplicationRecord
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true 
  validates :zip, numericality: true

  belongs_to :parent

end
