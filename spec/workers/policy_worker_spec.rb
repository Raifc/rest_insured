# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PolicyWorker, type: :worker do
  describe 'worker configuration' do
    subject(:worker) { described_class.new }

    it 'has policy-created queue name' do
      expect(worker.queue.name).to eq 'policy-created'
    end
  end

  describe '#work' do
    subject(:worker) { described_class.new }

    let(:message) do
      {
        "effective_from": '2024-02-23',
        "effective_until": '2024-03-23',
        "customer": {
          "name": 'John Doe',
          "document_number": '1234567839'
        },
        "vehicle": {
          "make": 'Toyota',
          "model": 'Hilux',
          "year": '2022',
          "plate": 'ABC123'
        }
      }.to_json
    end

    context 'when the message has the right params' do
      it 'creates a policy and returns ack' do
        expect(worker.work(message)).to eq(:ack)
      end

      context 'when the message has the wrong params' do
        let(:message) {}
        it 'returns reject' do
          expect(worker.work(message)).to eq(:reject)
        end
      end
    end
  end
end
