require 'rails_helper'

RSpec.describe FoodsController, type: :system do
  before { initializer('login') }
  let!(:path) { new_food_path }
  describe 'new action view' do
    it 'should require input for name of the food' do
      visit(path)
      expect(page).to(have_content('Name'))
    end
    it 'should require input for measurement_unit of the food' do
      visit(path)
      expect(page).to(have_content('Measurement'))
    end
    it 'should require input for price of the food' do
      visit(path)
      expect(page).to(have_content('Price'))
    end
    it 'should require input for quantity of the food' do
      visit(path)
      expect(page).to(have_content('Quantity'))
    end
  end
end
