require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can comment on a post" do
    create_new_post
    click_button("Comment")
    fill_in("Body", with: "Small woodland creature")
    click_button("Submit")
    expect(page).to have_content("Small woodland creature")
  end
end
