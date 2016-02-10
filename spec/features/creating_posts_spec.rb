require 'rails_helper.rb'

feature 'creating post' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_on 'Submit'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "bahaha not putting an image"
    click_on 'Submit'
    expect(page).to have_content("Error: you need an image to post.")
  end

end