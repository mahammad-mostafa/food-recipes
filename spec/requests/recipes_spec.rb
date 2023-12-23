require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  before { initializer('login') }
  let!(:recipe) { Recipe.first }
  describe 'index action method' do
    it 'should return correct response status' do
      get(recipes_path)
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(recipes_path)
      expect(response).to(render_template(:index))
    end
    it 'should return correct placeholder text' do
      get(recipes_path)
      expect(response.body).to(include('My'))
    end
  end
  describe 'show action method' do
    it 'should return correct response status' do
      get(recipe_path(recipe))
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(recipe_path(recipe))
      expect(response).to(render_template(:show))
    end
    it 'should return correct placeholder text' do
      get(recipe_path(recipe))
      expect(response.body).to(include('time'))
    end
  end
  describe 'new action method' do
    it 'should return correct response status' do
      get(new_recipe_path)
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(new_recipe_path)
      expect(response).to(render_template(:new))
    end
    it 'should return correct placeholder text' do
      get(new_recipe_path)
      expect(response.body).to(include('New'))
    end
  end
  describe 'public action method' do
    it 'should return correct response status' do
      get(public_recipes_path)
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(public_recipes_path)
      expect(response).to(render_template(:public))
    end
    it 'should return correct placeholder text' do
      get(public_recipes_path)
      expect(response.body).to(include('All'))
    end
  end
end
