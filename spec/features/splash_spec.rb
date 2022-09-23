require 'rails_helper'

RSpec.feature 'Splash Screen', type: :feature do
  background do
    visit root_path
  end

  scenario 'show Splash content' do
    expect(page).to have_content('Budget Calculator')
  end

  scenario 'show Splash' do
    expect(page).to have_content('Log-in')
  end

  scenario 'show Splash' do
    expect(page).to have_content('Sign up')
  end
end
