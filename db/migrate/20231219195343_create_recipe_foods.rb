class CreateRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_foods do |t|
      t.references :recipe, foreign_key: true, null: false
      t.references :food, foreign_key: true, null: false
      t.integer :quantity
      t.timestamps
    end
  end
end
