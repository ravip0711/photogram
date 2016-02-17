require 'rails_helper.rb'

feature 'Viewing user profiles' do
  background do
    user = create(:user)
    user_two = create(:user, id: user.id + 1, email: botty@example.com,
                                              user_name: 'botty')
    post_one = create(:post, user_id: user.id)
    post_two = create(:post, user_id: user_two.id, caption: 'this is a different post')

    sign_in_with user
    visit '/'
    first('.user-name').click_link
  end
  scenario 'visiting a profile page shows the user name in the url' do
    expect(page.current_path).to eq(profile_path('botty'))
  end
  scenario "a profile page only shows the specified user's posts" do
    expect(page).to have_content('nofilter')
    expect(page).to_not have_content('this is a different post')
  end
end