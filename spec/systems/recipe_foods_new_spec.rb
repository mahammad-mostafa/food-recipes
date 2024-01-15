require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :system do
  before { initializer('login') }
  let!(:path) { new_recipe_recipe_food_path(Recipe.first) }
  describe 'new action view' do
    it 'should require selection for a food item' do
      visit(path)
      expect(page).to(have_content('Food'))
    end
    it 'should require input for quantity of the food' do
      visit(path)
      expect(page).to(have_content('Quantity'))
    end
  end
end
