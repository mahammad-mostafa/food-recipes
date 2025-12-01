require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before { initializer }
  let!(:recipe) { Recipe.first }
  describe 'initial object' do
    it 'should be a valid recipe' do
      expect(recipe).to(be_valid)
    end
  end
  describe 'name attribute' do
    it 'should not be blank' do
      recipe.name = ''
      expect(recipe).to_not(be_valid)
    end
  end
  describe 'description attribute' do
    it 'should not be blank' do
      recipe.description = ''
      expect(recipe).to_not(be_valid)
    end
  end
  describe 'preparation_time attribute' do
    it 'should not be blank' do
      recipe.preparation_time = ''
      expect(recipe).to_not(be_valid)
    end
    it 'should be a number' do
      recipe.preparation_time = 'a'
      expect(recipe).to_not(be_valid)
    end
    it 'should not be zero' do
      recipe.preparation_time = 0
      expect(recipe).to_not(be_valid)
    end
    it 'should not be negative' do
      recipe.preparation_time = -1
      expect(recipe).to_not(be_valid)
    end
  end
  describe 'cooking_time attribute' do
    it 'should not be blank' do
      recipe.cooking_time = ''
      expect(recipe).to_not(be_valid)
    end
    it 'should be a number' do
      recipe.cooking_time = 'a'
      expect(recipe).to_not(be_valid)
    end
    it 'should not be zero' do
      recipe.cooking_time = 0
      expect(recipe).to_not(be_valid)
    end
    it 'should not be negative' do
      recipe.cooking_time = -1
      expect(recipe).to_not(be_valid)
    end
  end
end
