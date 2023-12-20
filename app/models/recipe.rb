class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy
end
