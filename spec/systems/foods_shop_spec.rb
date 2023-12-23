require 'rails_helper'

RSpec.describe FoodsController, type: :system do
  before { initializer('login') }
  let!(:food) { Food.last }
  let!(:path) { shop_foods_path }
  describe 'shop action view' do
    it 'should display number of missing foods as ingredients for any recipe' do
      visit(path)
      expect(page).to(have_content('Total amount of items: 1'))
    end
    it 'should display total price of missing foods for any recipe' do
      visit(path)
      expect(page).to(have_content("Total price of items: $#{food.quantity * food.price}"))
    end
    it 'should display name of each missing food' do
      visit(path)
      expect(first('article')).to(have_content(food.name.capitalize))
    end
    it 'should display quantity of missing each food' do
      visit(path)
      expect(first('article')).to(have_content(food.quantity))
    end
    it 'should display total price of missing each food' do
      visit(path)
      expect(first('article')).to(have_content(food.quantity * food.price))
    end
  end
end
