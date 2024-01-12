require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Comment, type: :model do
  it 'text should be present' do
    comment = build(:comment, text: nil)
    expect(comment).to_not be_valid
  end

  it 'updates the post\'s comments counter after saving' do
    user = create(:user)
    post = create(:post, author: user)
    comment = create(:comment, user:, post:)
    expect(post.comments_counter).to eq(1)
    comment.save
    post.reload
    expect(post.comments_counter).to eq(1)
  end
end
