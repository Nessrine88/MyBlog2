require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe 'Test the User show page', type: :system do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 4, author: user) }
  let!(:comments) { create_list(:comment, 6, post: posts.first, user:) }
  let!(:likes) { create_list(:like, 6, post: posts.first, user:) }

  it 'displays username of the user' do
    visit user_posts_path(user)
    expect(page).to have_content(user.name)
  end

  it 'displays picture of the user' do
    visit user_posts_path(user)
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  it 'displays the number of posts the user has written' do
    visit user_posts_path(user)
    expect(page).to have_content(user.posts.count)
  end

  it 'I can see a post\'s title' do
    visit user_posts_path(user)
    posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'I can see some of the post\'s body' do
    visit user_posts_path(user)
    posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it 'I can see the first comment on a post' do
    visit user_posts_path(user)
    expect(page).to have_content(comments.first.text)
  end

  it 'I can see how many comments a post has.' do
    visit user_posts_path(user)
    posts.each do |post|
      expect(page).to have_content(post.comments.count)
    end
  end

  it 'I can see how many likes a post has.' do
    visit user_posts_path(user)
    posts.each do |post|
      expect(page).to have_content(post.likes.count)
    end
  end

  it 'it redirects me to that post\'s show page.When I click post' do
    visit user_posts_path(user)
    click_on posts.first.title
    expect(page).to have_current_path(user_post_path(user, posts.first))
  end
end
