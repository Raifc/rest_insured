class Policy < ApplicationRecord
  belongs_to :vehicle
  belongs_to :insured_person

  accepts_nested_attributes_for :insured_person, :vehicle
end
