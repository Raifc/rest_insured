# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it 'is valid with valid attributes' do
    vehicle = Vehicle.create(plate: 'ABC123', make: 'Toyota', model: 'Camry', year: '2022')

    expect(vehicle.valid?).to be_truthy
  end

  it 'is invalid without required attributes' do
    vehicle = Vehicle.create

    expect(vehicle.errors.full_messages).to include(
      "Plate can't be blank",
      "Make can't be blank",
      "Model can't be blank",
      "Year can't be blank"
    )
  end
end
