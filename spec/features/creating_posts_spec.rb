require 'rails_helper.rb'

feature 'Creating post' do
  background do
    user = create(:user)
    sign_in_with user
  end
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_on 'Submit'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
    expect(page).to have_content("robotman")
  end

  scenario 'Needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "bahaha not putting an image"
    click_on 'Submit'
    expect(page).to have_content("Error: post could not be created, please check the form.")
  end

end