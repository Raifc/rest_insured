# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Policy, type: :model do
  it 'is valid with valid attributes' do
    vehicle = Vehicle.create(plate: 'ABC123', make: 'Toyota', model: 'Camry', year: '2022')
    customer = Customer.create(name: 'John Doe', document_number: '1234567890')
    policy = Policy.new(
      effective_from: Date.today,
      effective_until: Date.tomorrow,
      vehicle:,
      customer:
    )
    expect(policy.valid?).to be_truthy
  end

  it 'is invalid without effective_from' do
    policy = Policy.new(effective_until: Date.tomorrow)
    expect(policy.valid?).to be_falsey
    expect(policy.errors.full_messages).to include('Vehicle must exist', 'Customer must exist')
  end

  it 'is invalid without effective_until' do
    policy = Policy.new(effective_from: Date.today)
    expect(policy.valid?).to be_falsey
    expect(policy.errors.full_messages).to include("Effective until can't be blank")
  end
end
