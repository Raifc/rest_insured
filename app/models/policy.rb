class Policy < ApplicationRecord
  belongs_to :vehicle
  belongs_to :customer

  accepts_nested_attributes_for :customer, :vehicle
end
