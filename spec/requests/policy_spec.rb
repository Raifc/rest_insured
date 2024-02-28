# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Policies API', type: :request do
  describe 'GET /policies/:id' do
    let(:policy) { create(:policy) }
    let(:vehicle) { create(:vehicle) }
    let(:customer) { create(:customer) }

    context 'when the policy exists' do
      it 'returns the policy details' do
        get "/policies/#{policy.id}"

        expect(response).to have_http_status(:success)

        json_response = JSON.parse(response.body)
        expect(json_response['policy_id']).to eq(policy.id)
        expect(json_response['effective_from']).to eq(policy.effective_from.to_s)
        expect(json_response['effective_until']).to eq(policy.effective_until.to_s)
        expect(json_response['customer']['name']).to eq(customer.name)
        expect(json_response['customer']['cpf']).to eq(customer.document_number)
        expect(json_response['vehicle']['make']).to eq(vehicle.make)
        expect(json_response['vehicle']['model']).to eq(vehicle.model)
        expect(json_response['vehicle']['year']).to eq(vehicle.year)
        expect(json_response['vehicle']['plate']).to eq(vehicle.plate)
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
