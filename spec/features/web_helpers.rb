def create_new_post
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: 'Test post!'
  click_button 'Submit'
end

def create_long_post
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: 'Hello world,\n How are you?'
  click_button 'Submit'
  expect(page).to have_content('Hello world,\n How are you?')
end

def create_three_new_posts
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: 'Test post 1!'
  click_button 'Submit'
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: 'Test post 2!'
  click_button 'Submit'
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: 'Test post 3!'
  click_button 'Submit'
end

def sign_up
  visit '/posts'
  click_link 'Sign Up'
  fill_in 'Username', with: 'Jade'
  fill_in 'Password', with: '123'
  fill_in 'Email', with: 'jade@jade.com'
  click_button 'Submit'
end
