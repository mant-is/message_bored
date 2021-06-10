require 'rails_helper'

RSpec.describe 'links/show.html.erb' do
  context 'if the url is an image' do
    it 'renders the image inline' do
      link = build(:link, url: 'image.jpg')
      assign(:link, link)
      render # renders the path of describe block
      expect(rendered).to have_selector "img[src='#{ link.url }']"
    end
  end
end
