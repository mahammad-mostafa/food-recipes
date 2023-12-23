require 'rails_helper'

RSpec.describe FoodsController, type: :system do
  before { initializer('login') }
  let!(:food) { Food.first }
  let!(:path) { foods_path }
  describe 'index action view' do
    it 'should have a link to new food' do
      visit(path)
      expect(page).to(have_content('New'))
    end
    it 'should open new food page with a link' do
      visit(path)
      page.click_link('New')
      expect(page).to(have_current_path(new_food_path))
    end
    it 'should display name of each food' do
      visit(path)
      expect(first('article')).to(have_content(food.name.capitalize))
    end
    it 'should display measurement_unit of each food' do
      visit(path)
      expect(first('article')).to(have_content(food.measurement_unit))
    end
    it 'should display price of each food' do
      visit(path)
      expect(first('article')).to(have_content(food.price))
    end
    it 'should display quantity of each food' do
      visit(path)
      expect(first('article')).to(have_content(food.quantity))
    end
    it 'should have have delete link for each food' do
      visit(path)
      expect(first('article')).to(have_content('Delete'))
    end
  end
end
