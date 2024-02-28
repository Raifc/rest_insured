# frozen_string_literal: true

require 'sneakers'
require_relative '../../config/environment'
require_relative '../models/policy'

class PolicyWorker
  include Sneakers::Worker
  from_queue 'policy-created', durable: true

  def work(msg)
    puts '======= Creating Policy ======='
    payload = JSON.parse(msg)
    create_policy(payload)
  rescue StandardError => e
    puts "Error creating policy #{e.inspect}"
    reject!
  end

  private

  def create_policy(payload)
    ActiveRecord::Base.connection_pool.with_connection do
      vehicle = create_vehicle(payload['vehicle'])
      customer = create_customer(payload['customer'])
      policy = Policy.create!(
        effective_from: Date.parse(payload['effective_from']),
        effective_until: Date.parse(payload['effective_until']),
        customer:,
        vehicle:
      )
      puts "Policy created: #{policy.inspect}"
      ack!
    end
  end

  def create_vehicle(vehicle_params)
    Vehicle.create!(vehicle_params)
  end

  def create_customer(customer_params)
    Customer.create!(customer_params)
  end
end
