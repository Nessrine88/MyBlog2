require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe 'Test the User show page', type: :system do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 4, author: user) }

  it 'displays username of the user' do
    visit user_path(user)
    expect(page).to have_content(user.name)
  end

  it 'displays picture of the user' do
    visit user_path(user)
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  it 'displays the number of posts the user has written' do
    visit user_path(user)
    expect(page).to have_content(user.posts.count)
  end

  it 'displays the bio of the user' do
    visit user_path(user)
    expect(page).to have_content(user.bio)
  end

  it 'shows 3 recent posts of the user' do
    visit user_path(user)
    @recent_posts = user.three_recent_posts
    @recent_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  it 'displays a button that lets me view all of a user\'s posts' do
    visit user_path(user)
    expect(page).to have_link('See all posts')
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(user))
  end

  it 'redirects me to that user post\'s show page when I click a user\'s post' do
    visit user_path(user)
    first_post = user.posts.first
    click_on first_post.title
    expect(page).to have_current_path(user_post_path(user, first_post))
  end

  it 'redirects me to that user post\'s index page when I click a user\'s all posts' do
    visit user_path(user)
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(user))
  end
end
