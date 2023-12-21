class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name
      t.string :measurement_unit
      t.float :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
