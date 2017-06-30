require 'rails_helper'

RSpec.feature 'User Profile', type: :feature do
  scenario 'Displays the name of the user' do
    sign_up
    create_new_post
    click_link('Log Out')
    click_link('Jade')
    expect(page).to have_content("Jade's Profile")
  end
end
