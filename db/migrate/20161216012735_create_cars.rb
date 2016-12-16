class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :driver_id, null: false
      t.string  :make, null: false
      t.string  :model, null: false
      t.string  :year, null: false
      t.string  :color, null: false
      t.integer :approved, default: 0
      t.integer :default_car, default: 0

      t.timestamps null: false
    end
  end
end
