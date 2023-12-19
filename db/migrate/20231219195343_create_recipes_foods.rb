class CreateRecipesFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes_foods do |t|
      t.references :user, foreign_key: true, null: false
      t.references :recipe, foreign_key: true, null: false
      t.integer :quantity
      t.timestamps
    end
  end
end
