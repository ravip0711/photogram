require 'rails_helper.rb'

feature 'Create a new user' do
  background do
    visit '/'

    click_on 'Register'
  end

  scenario 'Can create a new user via the index page' do
    fill_in 'User name', with: "robot"
    fill_in 'Email', with: "robot@example.com"
    fill_in 'Password', with: "examples"
    fill_in 'Password confirmation', with: "examples"

    click_on 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario 'Requires a user name to successfully create an account' do
    fill_in 'Email', with: "robot@example.com"
    fill_in 'Password', with: "examples"
    fill_in 'Password confirmation', with: "examples"

    click_on 'Sign up'

    expect(page).to have_content("can't be blank") 
  end  

  scenario 'Requires a user name to be more than 4 characters' do
    fill_in 'User name', with: "rob"
    fill_in 'Email', with: "robot@example.com"
    fill_in 'Password', with: "examples"
    fill_in 'Password confirmation', with: "examples"

    click_on 'Sign up'

    expect(page).to have_content("minimum is 4 characters") 
  end

  scenario 'Requires a user name to be less 12 characters' do
    fill_in 'User name', with: "robbbbbbbbbbb"
    fill_in 'Email', with: "robot@example.com"
    fill_in 'Password', with: "examples"
    fill_in 'Password confirmation', with: "examples"

    click_on 'Sign up'

    expect(page).to have_content("maximum is 12 characters") 
  end
end