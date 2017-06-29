require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  scenario 'Can comment on a post' do
    sign_up
    create_new_post
    click_on('Comments')
    fill_in('comment_body', with: 'Small woodland creature')
    click_button('Post comment')
    expect(page).to have_content('Small woodland creature')
  end
end
