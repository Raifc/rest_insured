class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :make
      t.string :model
      t.string :year

      t.timestamps
    end
  end
end
