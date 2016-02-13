require 'rails_helper.rb'

feature 'Displaying index of posts' do
  background do
    user = create(:user)
    post_one = create(:post, user_id: user.id, caption: "This is post one")
    post_two = create(:post, user_id: user.id, caption: "This is post two")

    sign_in_with user
  end
  scenario 'the index displays correct created job information' do
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is post two")
    expect(page).to have_css("img[src*='coffee']")
  end
end