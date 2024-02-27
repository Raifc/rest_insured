# frozen_string_literal: true

class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show]

  def show
    render(
      json: @policy,
      serializer: PolicySerializer
    )
  end

  private

  def set_policy
    @policy = Policy.find(params[:id])
  end
end
