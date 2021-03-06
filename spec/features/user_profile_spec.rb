require 'rails_helper'

RSpec.feature 'User Profile', type: :feature do
  scenario 'Displays the name of the user' do
    sign_up
    create_new_post
    click_link('Log Out')
    click_link('Jade')
    expect(page).to have_content("Jade's Profile")
  end

  scenario 'Has a profile image upload field for profile owner' do
    sign_up
    expect(page).to have_button('Upload Avatar')
  end

  scenario 'Does not have a profile image upload field for other users' do
    sign_up
    create_new_post
    click_link('Log Out')
    click_link('Jade')
    expect(page).not_to have_button('Upload Avatar')
  end

  scenario 'Page displays a default avatar' do
    sign_up
    expect(page).to have_xpath("//img[contains(@src,'default_avatar.png')]")
  end

  scenario 'User can add image to their database entry' do
    sign_up
    click_button('Upload Avatar')
    attach_file("user_avatar", Rails.root + "thomas_avatar.jpg")
    click_button('Submit')
    user = User.find_by(username: 'Jade')
    expect(user.avatar.file.nil?).to be false
  end

  scenario 'User can upload a custom avatar' do
    sign_up
    click_button('Upload Avatar')
    attach_file("user_avatar", Rails.root + "thomas_avatar.jpg")
    click_button('Submit')
    expect(page).to have_xpath("//img[contains(@src,'thomas_avatar.jpg')]")
  end

end
