class Customer < ApplicationRecord
  has_many :purchases
  has_many :movies, through: :purshases
end
