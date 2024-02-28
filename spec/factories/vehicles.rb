# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    make { 'Toyota' }
    model { 'Corolla' }
    year { 2022 }
    plate { 'ABC1234' }
  end
end
