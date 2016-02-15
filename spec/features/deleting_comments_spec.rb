require 'rails_helper.rb'

feature 'Deleting comments' do
  background do
    user_one = create(:user)
    user_two = create(:user, user_name: "botty", email: "bot@example.com")

    post = create(:post)
    comment_one = create(:comment, context: "that's an ugly car", post_id: post.id, user_id: user_two.id)
    comment_two = create(:comment, id: 2, context: "that's a very nice car", post_id: post.id)
    
    sign_in_with user_two
  end
  scenario 'user can delete their own comments' do
    visit '/'
    expect(page).to have_content("that's an ugly car")
    click_on 'delete-1' # Dynamically add the id in your view
    expect(page).to_not have_content("that's an ugly car")
  end
  scenario 'user cannot delete a comment not belonging to them via the ui' do
    visit '/'
    expect(page).to have_content("that's a very nice car")
    expect(page).to have_css('#delete-2')
  end
  scenario 'user cannot delete a comment not belonging to them via urls' do
    visit '/'
    expect(page).to have_content("that's a very nice car")
    page.driver.submit :delete, "posts/2/comments/2", {}
    expect(page).to have_content("That doesn't belong to you")
    expect(page).to have_content("that's a very nice car")
  end
end