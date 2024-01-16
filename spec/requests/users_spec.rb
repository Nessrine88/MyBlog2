require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end


    it 'returns http success' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
    end
  end


  it 'renders the index template' do
    get users_path
    expect(response).to render_template(:index)
  end

  it 'renders the show template' do
    get '/users/:id'
    expect(response).to render_template(:show)
  end

  it 'includes the correct placeholder text in the response body' do
    get users_path
    expect(response.body).to include('Here is the list of users')
  end
  it 'includes the correct placeholder text in the response body' do
    get '/users/:id'
    expect(response.body).to include('Here is page for a specific user ')
  end
end
