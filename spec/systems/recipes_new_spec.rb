require 'rails_helper'

RSpec.describe RecipesController, type: :system do
  before { initializer('login') }
  let!(:path) { new_recipe_path }
  describe 'new action view' do
    it 'should require input for name of the recipe' do
      visit(path)
      expect(page).to(have_content('Name'))
    end
    it 'should require input for description of the recipe' do
      visit(path)
      expect(page).to(have_content('Description'))
    end
    it 'should require input for preparation time of the recipe' do
      visit(path)
      expect(page).to(have_content('Preparation'))
    end
    it 'should require input for cooking time of the recipe' do
      visit(path)
      expect(page).to(have_content('Cooking'))
    end
  end
end
