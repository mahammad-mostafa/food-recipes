require 'rails_helper'

RSpec.describe Food, type: :model do
  before { initializer }
  let!(:food) { Food.first }
  describe 'initial object' do
    it 'should be a valid food' do
      expect(food).to(be_valid)
    end
  end
  describe 'name attribute' do
    it 'should not be blank' do
      food.name = ''
      expect(food).to_not(be_valid)
    end
  end
  describe 'measurement_unit attribute' do
    it 'should not be blank' do
      food.measurement_unit = ''
      expect(food).to_not(be_valid)
    end
  end
  describe 'price attribute' do
    it 'should not be blank' do
      food.price = ''
      expect(food).to_not(be_valid)
    end
    it 'should be a number' do
      food.price = 'a'
      expect(food).to_not(be_valid)
    end
    it 'should not be zero' do
      food.price = 0
      expect(food).to_not(be_valid)
    end
    it 'should not be negative' do
      food.price = -1
      expect(food).to_not(be_valid)
    end
  end
  describe 'quantity attribute' do
    it 'should not be blank' do
      food.quantity = ''
      expect(food).to_not(be_valid)
    end
    it 'should be a number' do
      food.quantity = 'a'
      expect(food).to_not(be_valid)
    end
    it 'should not be zero' do
      food.quantity = 0
      expect(food).to_not(be_valid)
    end
    it 'should not be negative' do
      food.quantity = -1
      expect(food).to_not(be_valid)
    end
    it 'should not be decimal' do
      food.quantity = 1.1
      expect(food).to_not(be_valid)
    end
  end
end
