require 'rails_helper'

RSpec.describe 'User upvotes a link' do
  scenario 'they see the link\'s score increase' do
    link = create(:link)

    visit root_path

    within "#link_#{ link.id }" do
      click_link "Upvote"
    end

    expect(page).to have_css "#link_#{ link.id }", text: '1'
  end
end
