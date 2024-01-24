require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe 'Test the Post show page', type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  let!(:comments) { create_list(:comment, 3, post:, user: create(:user)) }
  let!(:likes) { create_list(:like, 1, post:, user: create(:user)) }

  it 'displays the post title' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.title)
  end

  it 'displays the number of comments' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.comments.count)
  end

  it 'displays the number of likes' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.likes.count)
  end

  it 'displays the post body' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.text)
  end

  it 'displays the username of each commentor' do
    visit user_post_path(user, post)
    comments.each do |comment|
      expect(page).to have_content(comment.user.name)
    end
  end

  it 'displays the comment each commentor left' do
    visit user_post_path(user, post)
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
