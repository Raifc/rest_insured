require 'sneakers'
require_relative '../../config/environment'
require_relative '../models/policy.rb'

class PolicyWorker
  include Sneakers::Worker
  from_queue 'policy-created', durable: true

  def work(msg)
    begin
      payload = JSON.parse msg
      vehicle_data = payload['vehicle']
      insured_person_data = payload['insured_person']

      policy = Policy.create!(
        effective_from: Date.parse(payload['effective_from']),
        effective_until: Date.parse(payload['effective_until']),
        vehicle: vehicle_data,
        insured_person: insured_person_data
      )

      ack!
    rescue StandardError => e
      reject!
    end
  end
end
