require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end


RSpec.describe 'Test the User index page', type: :system do
  it 'displays username of all other users' do
    user = create(:user)
    visit users_path
    expect(page).to have_content(user.name)
  end

  it 'displays picture of all other users' do
    user = create(:user)
    visit users_path
    expect(page).to have_css("img[src*='#{user.photo}']")
  end
  it 'displays the number of posts each user has written' do
    user = create(:user)
    visit users_path
    expect(page).to have_content(user.posts.count)
  end
  it ' redirect to the user\'s show page when the username is clicked' do
    user = create(:user)
    visit users_path
    click_link user.name
    expect(page).to have_current_path(user_path(user))
  end
end
