require 'sneakers'
require_relative '../../config/environment'
require_relative '../models/policy.rb'

class PolicyWorker
  include Sneakers::Worker
  from_queue 'policy-created', durable: true

  def work(msg)
    begin
      puts '======= Creating Policy ======='
      payload = JSON.parse msg
      vehicle = Vehicle.create!(payload['vehicle'])
      customer = Customer.create!(payload['customer'])

      policy = Policy.create!(
        effective_from: Date.parse(payload['effective_from']),
        effective_until: Date.parse(payload['effective_until']),
        customer: customer,
        vehicle: vehicle,
      )

      puts "Policy created: #{policy.inspect}"

      ack!
    rescue StandardError => e
      puts "Error creating policy #{e.inspect}"
      reject!
    end
  end
end
