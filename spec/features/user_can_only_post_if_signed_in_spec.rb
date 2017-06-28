require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'Can only post if signed in' do
    visit '/posts/new'
    expect(page).to have_content('Sorry, you need to be logged in to make a new post')
    expect(page).not_to have_field(message)
    sign_up
    expect(page).to have_field(message)
  end

  scenario 'New post link only present when user has signed in' do
    visit '/posts'
    expect(page).not_to have_content('New post')
    sign_up
    visit '/posts'
    expect(page).to have_content('New post')
  end
end
