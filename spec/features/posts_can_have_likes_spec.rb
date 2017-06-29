require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  scenario 'user can like a post' do
    sign_up
    create_new_post
    click_button('Like')
    expect(page).to have_content('likes: 1')
  end

  scenario 'user can only like a post once' do
    sign_up
    create_new_post
    click_button('Like')
    click_button('Like')
    expect(page).not_to have_content('likes: 2')
    expect(page).to have_content('likes: 1')
  end

  scenario 'user cannot like the post unless signed in' do
    sign_up
    create_new_post
    click_link('Log Out')
    visit '/posts'
    expect(page).not_to have_button('Like')
  end
end
