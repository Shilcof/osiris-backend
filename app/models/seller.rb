class Seller < ApplicationRecord
    has_many :listings

    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true, on: :create
end
