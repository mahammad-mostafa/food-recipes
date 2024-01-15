require 'rails_helper'

RSpec.describe UsersController, type: :request do
  before { initializer('login') }
  describe 'index action method' do
    it 'should return correct response status' do
      get(root_path)
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(root_path)
      expect(response).to(render_template(:index))
    end
    it 'should return correct placeholder text' do
      get(root_path)
      expect(response.body).to(include('Welcome'))
    end
  end
end
