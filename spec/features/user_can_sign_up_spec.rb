require 'rails_helper'

RSpec.feature 'User Sign Up', type: :feature do
  scenario 'Can sign up with a name, password and email' do
    visit '/users/new'
    fill_in 'Username', with: 'Jade'
    fill_in 'Email', with: 'jade@jade.com'
    fill_in 'Password', with: '123456'
    click_button 'Submit'
    expect(page).to have_content('Hello, Jade!')
  end
end
