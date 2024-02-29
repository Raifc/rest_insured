class Policy < ApplicationRecord
  validates :effective_from, :effective_until, presence: true
  belongs_to :vehicle
  belongs_to :customer

  accepts_nested_attributes_for :customer, :vehicle
end
