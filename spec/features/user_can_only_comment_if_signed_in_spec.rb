require 'rails_helper'

RSpec.feature 'Comment restriction', type: :feature do
  scenario 'Can only comment if signed in' do
    sign_up
    create_new_post
    click_link('Log Out')
    visit('/posts')
    click_link('Comments')
    expect(page).to have_content('Please sign up to comment on a post!')
    expect(page).not_to have_field('comment_body')
    expect(page).not_to have_button('Post comment')
    log_in
    visit('/posts')
    click_link('Comments')
    expect(page).to have_field('comment_body')
    expect(page).to have_button('Post comment')
  end
end
