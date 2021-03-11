class Customer < ApplicationRecord
  has_many :orders
  has_many :movies
end
