class CreateWheels < ActiveRecord::Migration[7.1]
  def change
    create_table :wheels do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.integer :wheel_size

      t.timestamps
    end
  end
end
