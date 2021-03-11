class Invoice < ApplicationRecord
  has_many :order
end
