require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :request do
  before { initializer('login') }
  let!(:recipe) { Recipe.first }
  describe 'new action method' do
    it 'should return correct response status' do
      get(new_recipe_recipe_food_path(recipe))
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(new_recipe_recipe_food_path(recipe))
      expect(response).to(render_template(:new))
    end
    it 'should return correct placeholder text' do
      get(new_recipe_recipe_food_path(recipe))
      expect(response.body).to(include('New'))
    end
  end
end
