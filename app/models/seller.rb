class Seller < ApplicationRecord
    has_many :listings

    has_secure_password

    validates :password, confirmation: true, on: :create
end
