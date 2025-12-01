require 'rails_helper'

RSpec.describe RecipesController, type: :system do
  before { initializer('public') }
  let!(:recipe) { Recipe.first }
  let!(:path) { public_recipes_path }
  describe 'public action view' do
    it 'should display name of the recipes user' do
      visit(path)
      expect(page).to(have_content(recipe.user.name.capitalize))
    end
    it 'should display name of each recipe' do
      visit(path)
      expect(find('article')).to(have_content(recipe.name.capitalize))
    end
    it 'should display number of ingredients for each recipe' do
      visit(path)
      expect(find('article')).to(have_content("Total food items: #{recipe.recipe_foods.length}"))
    end
    it 'should display total price of ingredients for each recipe' do
      visit(path)
      price = recipe.recipe_foods.reduce(0) { |total, item| total + (item.quantity * item.food.price) }
      expect(find('article')).to(have_content("Total price: $#{price}"))
    end
    it 'should open each recipe show page with a link' do
      visit(path)
      find('article').click_link('Details')
      expect(page).to(have_current_path(recipe_path(recipe)))
    end
  end
end
