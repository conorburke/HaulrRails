class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string  :email, null: false
      t.string  :password_digest, null: false
      t.string  :phone, null: false
      t.string  :zipcode, null: false
      t.string  :status, default: "user"
      t.integer :active_driver, limit: 1, default: 0

      t.timestamps null: false
    end
  end
end
