require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  scenario 'user can like a post' do
    # sign_up
    create_new_post
    click_button('Like')
    expect(page).to have_content('likes: 1')
  end
end
