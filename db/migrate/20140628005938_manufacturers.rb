class Manufacturers < ActiveRecord::Migration
  def change
    create_table :manufactuerers do |t|
      t.string :name, null: false
      t.string :country, null: false
    end
  end
end
