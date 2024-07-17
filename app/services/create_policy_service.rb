#fronzen_string_literal: true

class CreatePolicyService
  def initialize(payload)
    @payload = payload
  end

  attr_reader :payload

  def call
    vehicle = Vehicle.create!(payload['vehicle'])
    customer = Customer.create!(payload['customer'])
    Policy.create!(
      effective_from: Date.parse(payload['effective_from']),
      effective_until: Date.parse(payload['effective_until']),
      customer:,
      vehicle:
    )
  end
end
