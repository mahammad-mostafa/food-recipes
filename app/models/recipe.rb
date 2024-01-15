class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, numericality: { greater_than: 0 }
  validates :cooking_time, numericality: { greater_than: 0 }
  has_many :recipe_foods, dependent: :destroy
  belongs_to :user
  paginates_per 3

  def total_price
    recipe_foods.includes([:food]).reduce(0) { |total, item| total + (item.quantity * item.food.price) }.round(2)
  end
end
