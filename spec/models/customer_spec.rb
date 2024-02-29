# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is valid with valid attributes' do
    customer = Customer.create(name: 'John Doe', document_number: '1234567890')

    expect(customer.valid?).to be_truthy
  end

  it 'is invalid without required attributes' do
    customer = Customer.create
    expect(customer.errors.full_messages).to include(
      "Name can't be blank",
      "Document number can't be blank"
    )
  end
end
