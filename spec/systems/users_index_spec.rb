require 'rails_helper'

RSpec.describe UsersController, type: :system do
  before { initializer('login') }
  let!(:user) { User.first }
  describe 'index action view' do
    it 'should display name of logged user' do
      visit(root_path)
      expect(page).to(have_content(user.name))
    end
    it 'should display number of recipes owned by the user' do
      visit(path)
      expect(page).to(have_content("#{user.recipes.length} recipes"))
    end
    it 'should display number of food items owned by the user' do
      visit(path)
      expect(page).to(have_content("#{user.foods.length} food"))
    end
    it 'should have a logout link' do
      visit(root_path)
      expect(page).to(have_content('Logout'))
    end
  end
end
