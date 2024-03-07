# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PolicySerializer do
  let(:customer) { Customer.create(name: 'John Doe', document_number: '123456789') }
  let(:vehicle) { Vehicle.create(make: 'Toyota', model: 'Corolla', year: 2020, plate: 'ABC1234') }
  let(:policy) { Policy.create(customer:, vehicle:, effective_from: '2022-03-02', effective_until: '2024-03-02') }
  let(:serializer) { described_class.new(policy) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer).as_json }

  describe 'attributes' do
    it 'builds the attributes' do
      expected_result = {
        policy_id: 1,
        effective_from: Date.parse('2022-03-02'),
        effective_until: Date.parse('2024-03-02'),
        customer: {
          name: 'John Doe',
          cpf: '123456789'
        },
        vehicle: {
          make: 'Toyota',
          model: 'Corolla',
          year: '2020',
          plate: 'ABC1234'
        }
      }

      expect(serializer.attributes).to eq(expected_result)
    end
  end
end
