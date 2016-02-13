require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    user = create(:user)
    user_two = create(:user, email: "bot@example.com",
                             user_name: "botty",
                             id: user.id + 1)

    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: user_two.id)

    sign_in_with user
    visit '/'
  end

  scenario 'can edit a post as the owner' do
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    expect(page).to have_content('Edit')

    click_on 'Edit'
    fill_in 'Caption', with: "this is amazing coffee"
    click_on 'Submit'

    expect(page).to have_content("Post successfully updated.")
    expect(page).to have_content("this is amazing coffee")
  end

  scenario "cannot edit a post that doesn't belong to you via the show page" do
    find(:xpath, "//a[contains(@href, 'posts/2')]").click
    expect(page).to_not have_content('Edit')
  end

  scenario "cannot edit a post that doesn't belong to you via url path" do
    visit "/posts/2/edit"
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("That post doesn't belong to you!")
  end

  scenario 'will not update a post without an attached image' do
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_on 'Edit'
    attach_file('Image', 'spec/files/coffee.zip')
    click_on 'Submit'
    
    expect(page).to have_content("Error with form inputs.")
  end
end