class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, numericality: { greater_than: 0 }
  validates :cooking_time, numericality: { greater_than: 0 }
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
end
