class PolicySerializer < ActiveModel::Serializer
  attribute :id, key: :policy_id
  attribute :effective_from
  attribute :effective_until

  attribute :customer do
    {
      name: object.customer.name,
      cpf: object.customer.document_number
    }
  end

  attribute :vehicle do
    {
      make: object.vehicle.make,
      model: object.vehicle.model,
      year: object.vehicle.year,
      plate: object.vehicle.plate
    }
  end
end
