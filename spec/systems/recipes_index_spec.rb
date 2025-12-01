require 'rails_helper'

RSpec.describe RecipesController, type: :system do
  before { initializer('login') }
  let!(:recipe) { Recipe.first }
  let!(:path) { recipes_path }
  describe 'index action view' do
    it 'should have a link to new recipe' do
      visit(path)
      expect(page).to(have_content('New'))
    end
    it 'should open new recipe page with a link' do
      visit(path)
      page.click_link('New')
      expect(page).to(have_current_path(new_recipe_path))
    end
    it 'should display name of each recipe' do
      visit(path)
      expect(find('article')).to(have_content(recipe.name.capitalize))
    end
    it 'should display description of each recipe' do
      visit(path)
      expect(find('article')).to(have_content(recipe.description))
    end
    it 'should open each recipe show page with a link' do
      visit(path)
      find('article').click_link('Details')
      expect(page).to(have_current_path(recipe_path(recipe)))
    end
    it 'should have have delete link for each recipe' do
      visit(path)
      expect(find('article')).to(have_content('Delete'))
    end
  end
end
