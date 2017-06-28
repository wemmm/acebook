def create_new_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Test post!"
  click_button "Submit"
end

def create_three_new_posts
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Test post 1!"
  click_button "Submit"
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Test post 2!"
  click_button "Submit"
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Test post 3!"
  click_button "Submit"
end
