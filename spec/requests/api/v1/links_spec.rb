require 'rails_helper'

RSpec.describe 'GET /api/v1/links' do
  it 'returns a list of all links, most popular first' do
    least_popular = create(:link)
    most_popular = create(:link, upvotes: 4)

    get '/api/v1/links'
    expect(json_body.count).to eq 2
    most_popular_json = json_body[0]
    expect(most_popular_json).to eq({
      "id" => most_popular.id,
      "title" => most_popular.title,
      "url" => most_popular.url,
      "upvotes" => most_popular.upvotes,
      "downvotes" => most_popular.downvotes})
  end
end

RSpec.describe 'POST /api/v1/links' do
  it 'creates the link' do
    link_params = attributes_for(:link)
    post '/api/v1/links', params: { link: link_params }

    expect(response.status).to eq 201
    expect(Link.last.title).to eq link_params[:title]
  end

  context 'when there are invalied attributes' do
    it 'returns a 422, with errors' do
      link_params = attributes_for(:link, :invalid)
      post '/api/v1/links', params: { link: link_params }

      expect(response.status).to eq 422
      expect(json_body.fetch("errors")).not_to be_empty
    end
  end
end
