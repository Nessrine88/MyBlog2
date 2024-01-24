require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  it 'renders the index template' do
    get users_path
    expect(response).to render_template(:index)
  end

  it 'renders the show template' do
    @user = create(:user)
    get user_path(@user)
    expect(response).to render_template(:show)
  end
end
