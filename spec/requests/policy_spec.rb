# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Policies API', type: :request do
  describe 'GET /policies/:id' do
    let(:policy) { create(:policy) }
    let(:vehicle) { create(:vehicle) }
    let(:customer) { create(:customer) }

    context 'when the policy exists' do
      let(:expected_response) do
        { 'policy_id' => 1,
          'effective_from' => '2022-02-03',
          'effective_until' => '2024-02-03',
          'customer' => { 'name' => 'John Doe', 'cpf' => '123456789' },
          'vehicle' => { 'make' => 'Toyota', 'model' => 'Corolla', 'year' => '2022', 'plate' => 'ABC1234' } }
      end
      it 'returns the policy details' do
        get "/policies/#{policy.id}"

        expect(response).to have_http_status(:success)

        json_response = JSON.parse(response.body)

        expect(json_response).to eq(expected_response)
      end
    end

    context 'when the policy does not exist' do
      it 'returns a not found error' do
        get '/policies/123'

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
