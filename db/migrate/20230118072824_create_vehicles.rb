class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.integer :model_year

      t.timestamps
    end
  end
end
