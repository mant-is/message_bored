require 'rails_helper'

RSpec.feature 'User submits a link' do 
  scenario 'they see the page for the submitted link' do
    link_title = 'Ruby for Good'
    link_url = 'https://rubyforgood.org/'

    visit root_path
    click_on 'Submit a new link'
    fill_in 'link_title', with: link_title
    fill_in 'link_url', with: link_url
    click_on 'Submit'

    expect(page).to have_link link_title, href: link_url
  end
end

