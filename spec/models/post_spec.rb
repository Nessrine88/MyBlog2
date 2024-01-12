require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'my first post',
             text: 'this the first description text of my first descrption post',
             likes_counter: 0,
             comments_counter: 0)
  end
  before { subject.save }

  it 'title should be present ' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater or equal to zero' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater or equal to zero' do
    subject.comments_counter = -3
    expect(subject).to_not be_valid
  end

  it 'text length should be shorter than 250 character' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end


  it 'returns five recent comments' do
    post = create(:post)
    create_list(:comment, 6, post:)
    post.reload
    recent_comments = post.five_recent_comments
    expect(recent_comments.count).to eq(5)
  end

  it 'updates the author\'s posts counter after saving' do
    user = create(:user)
    post = create(:post, author: user)
    expect(user.posts_counter).to eq(1)
    post.save
    user.reload
    expect(user.posts_counter).to eq(1)
  end
end
