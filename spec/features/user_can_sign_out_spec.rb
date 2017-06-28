require 'rails_helper'

RSpec.feature 'User Log Out', type: :feature do
  scenario 'Can Log out' do
    sign_up
    click_on('Log Out')
    visit '/posts/new'
    expect(page).to have_content('Sorry, you need to be logged in to make a new post')
  end
end
