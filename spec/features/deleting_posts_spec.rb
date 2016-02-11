require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: "coffee for days")

    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_on 'Edit'
  end
  scenario 'Can delete a single post' do
    click_on 'Delete'
    expect(page).to have_content("Post deleted.")
    expect(page).to_not have_content("coffee for days")
  end
end