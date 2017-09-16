class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :challenge_id
      t.integer :payer_id

      t.timestamps
    end
  end
end
