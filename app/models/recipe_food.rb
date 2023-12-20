class RecipeFood < ApplicationRecord
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :foods
  belongs_to :recipes
end
