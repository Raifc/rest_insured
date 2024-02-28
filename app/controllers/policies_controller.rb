# frozen_string_literal: true

class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show]

  def show
    render json: @policy
  end

  private

  def set_policy
    policy_id = params[:id]
    Rails.logger.info("Attempting to find policy with ID: #{policy_id}")

    @policy = Policy.find(policy_id)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Policy not found' }, status: :not_found
  end
end
