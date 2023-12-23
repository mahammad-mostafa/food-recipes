require 'rails_helper'

RSpec.describe RecipesController, type: :system do
  before { initializer('login') }
  let!(:recipe) { Recipe.first }
  let!(:path) { recipe_path(recipe) }
  describe 'show action view' do
    it 'should display name of the recipe' do
      visit(path)
      expect(page).to(have_content(recipe.name.capitalize))
    end
    it 'should display preparation time of the recipe' do
      visit(path)
      expect(page).to(have_content(recipe.preparation_time))
    end
    it 'should display cooking time of the recipe' do
      visit(path)
      expect(page).to(have_content(recipe.cooking_time))
    end
    it 'should display description of the recipe' do
      visit(path)
      expect(page).to(have_content(recipe.description))
    end
    it 'should have a link to change visiblity status' do
      visit(path)
      button = recipe.public ? 'Set private' : 'Set public'
      expect(page).to(have_content(button))
    end
    it 'should have a link to add ingredients' do
      visit(path)
      expect(page).to(have_content('Add ingredient'))
    end
    it 'should have a link to shopping list' do
      visit(path)
      expect(page).to(have_content('Shopping list'))
    end
    it 'should open shopping list page with a link' do
      visit(path)
      page.click_link('Shopping list')
      expect(page).to(have_current_path(shop_foods_path))
    end
    it 'should open new ingredient page with a link' do
      visit(path)
      page.click_link('Add ingredient')
      expect(page).to(have_current_path(new_recipe_recipe_food_path(recipe)))
    end
    it 'should display name of each ingredient' do
      visit(path)
      expect(page).to(have_content(recipe.recipe_foods.first.food.name.capitalize))
    end
  end
end
