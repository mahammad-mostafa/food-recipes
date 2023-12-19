class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name
      t.integer :quantity
      t.integer :price
      t.string :measurement_unit
      t.timestamps
    end
  end
end
