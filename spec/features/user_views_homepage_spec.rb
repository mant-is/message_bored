require 'rails_helper'

RSpec.feature 'User views homepage' do
  scenario 'they see existing links' do
    link = create(:link)

    visit root_path
    expect(page).to have_link link.title, href: link.url
  end

  scenario 'the links are sorted from most popular to least popular' do
    create(:link, title: "average popularity", upvotes: 2, downvotes: 1)
    create(:link, title: "least popularity", upvotes:3, downvotes:3)
    create(:link, title: "most popularity", upvotes: 5, downvotes: 1)

    visit root_path

    expect(page).to have_css "#links li:nth-child(1)", text: "most popularity"
    expect(page).to have_css "#links li:nth-child(2)", text: "average popularity"
    expect(page).to have_css "#links li:nth-child(3)", text: "least popularity"
  end
end
