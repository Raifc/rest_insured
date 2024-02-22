class Policy < ApplicationRecord
  belongs_to :vehicle
  belogns_to :insured_person
end
