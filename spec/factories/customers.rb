# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { 'John Doe' }
    document_number { '123456789' }
  end
end
