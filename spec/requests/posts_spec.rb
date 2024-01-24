require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end


RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      @user = create(:user)
      get user_posts_path(@user)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      @user = create(:user)
      @post = create(:post)
      get user_post_path(@user, @post)
      expect(response).to have_http_status(:success)
    end
  end

  it 'renders the index template' do
    @user = create(:user)
    get user_posts_path(@user)
    expect(response).to render_template(:index)
  end

  it 'renders the show template' do
    @user = create(:user)
    @post = create(:post)
    get user_post_path(@user, @post)
    expect(response).to render_template(:show)
  end
end
