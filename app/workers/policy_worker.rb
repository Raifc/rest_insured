# frozen_string_literal: true

require 'sneakers'
require_relative '../../config/environment'
require_relative '../models/policy'

class PolicyWorker
  include Sneakers::Worker
  from_queue 'policy-created', durable: true

  def work(message)
    payload = JSON.parse(message)
    create_policy(payload)
  rescue StandardError => e
    puts "Error creating policy #{e.inspect}"
    reject!
  end

  private

  def create_policy(payload)
    ActiveRecord::Base.connection_pool.with_connection do
      policy = CreatePolicyService.new(payload).call
      puts "Policy created: #{policy.inspect}"
      ack!
    end
  end
end
