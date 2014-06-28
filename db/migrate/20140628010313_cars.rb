class Cars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :year, null: false
      t.integer :mileage, null: false
      t.integer :manufactuerer_id, null: false
      t.string :color, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
