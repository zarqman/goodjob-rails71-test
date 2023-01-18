class CreateEngines < ActiveRecord::Migration[7.1]
  def change
    create_table :engines do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.integer :cylinders

      t.timestamps
    end
  end
end
