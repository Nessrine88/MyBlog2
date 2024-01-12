require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Like, type: :model do
  it 'updates the post\'s likes counter after saving' do
    user = create(:user)
    post = create(:post, author: user)
    expect(post.likes_counter).to eq(0)
    create(:like, user:, post:)
    post.update(likes_counter: post.likes.count)
    post.reload
    expect(post.likes_counter).to eq(1)
  end
end
