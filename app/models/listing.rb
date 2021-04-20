class Listing < ApplicationRecord
  belongs_to :seller
  has_one_attached :image

  validates :name, presence: true, no_symbols: true
  validates :description, presence: true, no_symbols: true

  validates :name, length: { in: 3..30 }, allow_blank: true
  validates :description, length: { in: 50..2000 }, allow_blank: true

  # geokit distance requirements
  # acts_as_mappable  lng_column_name: :longitude,
  #                   lat_column_name: :latitude
end
