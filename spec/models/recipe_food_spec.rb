require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before { initializer }
  let!(:ingredient) { RecipeFood.first }
  describe 'initial object' do
    it 'should be a valid ingredient' do
      expect(ingredient).to(be_valid)
    end
  end
  describe 'quantity attribute' do
    it 'should not be blank' do
      ingredient.quantity = ''
      expect(ingredient).to_not(be_valid)
    end
    it 'should be a number' do
      ingredient.quantity = 'a'
      expect(ingredient).to_not(be_valid)
    end
    it 'should not be zero' do
      ingredient.quantity = 0
      expect(ingredient).to_not(be_valid)
    end
    it 'should not be negative' do
      ingredient.quantity = -1
      expect(ingredient).to_not(be_valid)
    end
    it 'should not be decimal' do
      ingredient.quantity = 1.1
      expect(ingredient).to_not(be_valid)
    end
  end
end
