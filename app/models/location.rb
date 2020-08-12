class Location < ApplicationRecord
  validates :addres1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true 
  validates :zip, numericality: true

  belongs_to :parent

end
