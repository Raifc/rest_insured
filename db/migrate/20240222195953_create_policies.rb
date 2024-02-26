class CreatePolicies < ActiveRecord::Migration[7.0]
  def change
    create_table :policies do |t|
      t.date :effective_from
      t.date :effective_until
      t.references :vehicle, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
