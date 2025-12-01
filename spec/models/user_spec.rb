require 'rails_helper'

RSpec.describe User, type: :model do
  before { initializer }
  let!(:user) { User.first }
  describe 'initial object' do
    it 'should be a valid user' do
      expect(user).to(be_valid)
    end
  end
  describe 'name attribute' do
    it 'should not be blank' do
      user.name = ''
      expect(user).to_not(be_valid)
    end
  end
  describe 'email attribute' do
    it 'should not be blank' do
      user.email = ''
      expect(user).to_not(be_valid)
    end
  end
  describe 'password attribute' do
    it 'should not be blank' do
      user.password = ''
      expect(user).to_not(be_valid)
    end
  end
end
