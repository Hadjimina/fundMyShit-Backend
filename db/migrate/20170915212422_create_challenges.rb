class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :current_price
      t.integer :challenger_id
      t.boolean :completed

      t.timestamps
    end
  end
end
