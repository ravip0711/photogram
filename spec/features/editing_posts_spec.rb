require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    job = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_on 'Edit'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "this is amazing coffee"

    click_on 'Submit'

    expect(page).to have_content("Post successfully updated.")
    expect(page).to have_content("this is amazing coffee")
  end

  it 'Will not update a post without an image' do
    attach_file('Image', 'spec/files/coffee.zip')

    click_on 'Submit'
    expect(page).to have_content("Error with form inputs.")
  end
end