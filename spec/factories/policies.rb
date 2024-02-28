# frozen_string_literal: true

FactoryBot.define do
  factory :policy do
    id { 1 }
    effective_from { '2022-02-03' }
    effective_until { '2024-02-03' }
    association :customer, factory: :customer
    association :vehicle, factory: :vehicle
  end
end
