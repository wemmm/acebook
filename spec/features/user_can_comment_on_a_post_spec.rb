require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  scenario 'User can comment on a post' do
    sign_up
    create_new_post
    click_on('Comments')
    fill_in('comment_body', with: 'Small woodland creature')
    click_button('Post comment')
    expect(page).to have_content('Small woodland creature')
  end

  scenario "Belong to a user and display the commenter's username in the view" do
    sign_up
    create_new_post
    click_on('Comments')
    fill_in('comment_body', with: 'Small woodland creature')
    click_button('Post comment')
    expect(page).to have_content('Comment by Jade')
  end
end
