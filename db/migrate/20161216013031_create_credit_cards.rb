class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :user_id, null: false
      t.string  :card_number, null: false
      t.string  :card_name, null: false
      t.string  :expiration_date, null: false
      t.string  :security_code, null: false
      t.integer :approved, default: 1
      t.integer :default_card, default: 0

      t.timestamps null: false
    end
  end
end
