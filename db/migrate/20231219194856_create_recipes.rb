class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name
      t.string :description
      t.float :preparation_time, precision: 4, scale: 2
      t.float :cooking_time, precision: 4, scale: 2
      t.boolean :public
      t.timestamps
    end
  end
end
