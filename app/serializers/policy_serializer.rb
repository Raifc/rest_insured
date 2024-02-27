class PolicySerializer < ActiveModel::Serializer
  attribute(:policy) do
    {
      policy_id: object.id,
      effective_from: object.effective_from,
      effective_until: object.effective_until,
      customer: {
        name: object.customer.name,
        cpf: object.customer.document_number
      },
      vehicle:{
        make: object.vehicle.make,
        model: object.vehicle.model,
        year: object.vehicle.year,
        plate: object.vehicle.plate
      }
    }
  end
end
