def create_new_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Test post!"
  click_button "Submit"
end
