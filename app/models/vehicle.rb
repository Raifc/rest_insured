class Vehicle < ApplicationRecord
  validates :plate, :make, :model, :year, presence: true
end
