require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/:id/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:id/posts/:id'
      expect(response).to have_http_status(:success)
    end
  end

  it 'renders the index template' do
    get '/users/:id/posts'
    expect(response).to render_template(:index)
  end

  it 'renders the show template' do
    get '/users/:id/posts/:id'
    expect(response).to render_template(:show)
  end

  it 'includes the correct placeholder text in the response body' do
    get '/users/:id/posts'
    expect(response.body).to include('Here is the list of posts for a given user')
  end
  it 'includes the correct placeholder text in the response body' do
    get '/users/:id/posts/:id'
    expect(response.body).to include('Here is a specific post for a given user')
  end
end
