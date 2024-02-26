# frozen_string_literal: true

class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show]

  def show
    render json: {
      policy_id: @policy.id,
      effective_from: @policy.effective_from,
      effective_until: @policy.effective_until,
      insured_person: {
        name: @policy.insured_person.name,
        cpf: @policy.insured_person.document_number
      },
      vehicle:{
        make: @policy.vehicle.make,
        model: @policy.vehicle.model,
        year: @policy.vehicle.year,
        plate: @policy.vehicle.plate
      }
    }
  end

  private

  def set_policy
    @policy = Policy.find(params[:id])
  end
end
