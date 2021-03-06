require 'rails_helper.rb'

feature 'Creating comments' do
  scenario 'can comment on an existing post' do
    user = create(:user)
    post = create(:post, user_id: user.id)
    sign_in_with user

    visit '/'
    fill_in "comment[content]", with: "this is a cool post"
    click_on 'Submit'

    expect(page).to have_content("this is a cool post")
  end
end