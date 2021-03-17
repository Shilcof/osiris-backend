class Listing < ApplicationRecord
  belongs_to :seller
  has_one_attached :image
end
