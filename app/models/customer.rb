class Customer < ApplicationRecord
  validates :name, :document_number, presence: true
end
