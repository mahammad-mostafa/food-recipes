require 'rails_helper'

RSpec.describe FoodsController, type: :request do
  before { initializer('login') }
  describe 'index action method' do
    it 'should return correct response status' do
      get(foods_path)
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(foods_path)
      expect(response).to(render_template(:index))
    end
    it 'should return correct placeholder text' do
      get(foods_path)
      expect(response.body).to(include('My'))
    end
  end
  describe 'new action method' do
    it 'should return correct response status' do
      get(new_food_path)
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(new_food_path)
      expect(response).to(render_template(:new))
    end
    it 'should return correct placeholder text' do
      get(new_food_path)
      expect(response.body).to(include('New'))
    end
  end
  describe 'shop action method' do
    it 'should return correct response status' do
      get(shop_foods_path)
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(shop_foods_path)
      expect(response).to(render_template(:shop))
    end
    it 'should return correct placeholder text' do
      get(shop_foods_path)
      expect(response.body).to(include('Shopping'))
    end
  end
end
