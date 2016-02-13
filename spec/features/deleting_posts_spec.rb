require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    user = create(:user)
    post = create(:post, user_id: user.id, caption: "coffee for days")

    sign_in_with user
  
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_on 'Edit'
  end
  scenario 'can delete a single post' do
    click_on 'Delete'
    
    expect(page).to have_content("Post deleted.")
    expect(page).to_not have_content("coffee for days")
  end
end