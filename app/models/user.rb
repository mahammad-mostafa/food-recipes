class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  validates :name, presence: true
  has_many :recipes
  has_many :foods
end
