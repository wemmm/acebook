require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'can see a timestamp for a post' do
    create_new_post
    expect(page).to have_content('/17')
  end

  scenario 'posts are displayed newest to oldest' do
    create_three_new_posts
    expect('3').to appear_before('2')
    expect('2').to appear_before('1')
    expect('3').to appear_before('1')
  end
end
