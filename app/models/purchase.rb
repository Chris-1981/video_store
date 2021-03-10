class Purchase < ApplicationRecord
  belongs_to :movie
  belongs_to :customer
end
