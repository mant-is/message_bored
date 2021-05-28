require 'rails_helper'

RSpec.describe 'User downvotes a link' do
  scenario 'they see the link\'s score increase' do
    link = create(:link)

    visit root_path

    within "#link_#{ link.id }" do
      click_link "Downvote"
    end

    expect(page).to have_css "#link_#{ link.id }", text: '-1'
  end
end
