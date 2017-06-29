require 'rails_helper'

RSpec.feature "Navbar", type: :feature do
  scenario "User can see a navbar on all pages" do
    sign_up
    create_new_post
    visit '/posts'
    expect(page).to have_content('Home')
    click_link('Comments')
    expect(page).to have_content('Home')
  end
end
