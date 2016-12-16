class CreateRides < ActiveRecord::Migration[5.0]
  def change
    create_table :rides do |t|
      t.string  :status, default: "waiting"
      t.integer :rider_id, null: false
      t.integer :driver_id
      t.integer :rider_score
      t.integer :driver_score

      t.timestamps null: false
    end
  end
end
