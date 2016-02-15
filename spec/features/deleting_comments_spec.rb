require 'rails_helper.rb'

feature 'Deleting comments' do
  background do
    user = create(:user)
    user_two = create(:user, id: user.id + 1, user_name: "botty", email: "bot@example.com")

    post = create(:post)
    comment = create(:comment, post_id: post.id, user_id: user_two.id)
    comment_two = create(:comment, id: 2, post_id: post.id, content: "that's a very nice car")
    
    sign_in_with user_two
  end
  scenario 'user can delete their own comments' do
    skip # Can't figure out how to select to delete the comment
    visit '/'
    expect(page).to have_content("Nice Post")
    click_on 'delete-1'
    expect(page).to_not have_content("Nice Post")
  end
  scenario 'user cannot delete a comment not belonging to them via the ui' do
    skip # Can't figure out how to select to delete the comment
    visit '/'
    expect(page).to have_content("that's a very nice car")
    expect(page).to have_css('#delete-2')
  end
  scenario 'user cannot delete a comment not belonging to them via urls' do
    skip # Can't figure out how to select to delete the comment
    visit '/'
    expect(page).to have_content("that's a very nice car")
    page.driver.submit :delete, "posts/2/comments/2", {}
    expect(page).to have_content("That doesn't belong to you")
    expect(page).to have_content("that's a very nice car")
  end
end