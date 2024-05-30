        # spec/controllers/projects_controller_spec.rb
require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      user = FactoryBot.create(:user)
      sign_in user
      get :index
      expect(response).to be_successful
    end
  end
end