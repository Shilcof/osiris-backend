class Listing < ApplicationRecord
  belongs_to :seller
  has_one_attached :image

  validates :name, presence: true, no_symbols: true
  validates :description, presence: true, no_symbols: true
end
