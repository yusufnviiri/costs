require 'rails_helper'

RSpec.describe 'Group page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Daniel', email: 'Daniel@gmail.com', password: '1234567', password_confirmation: '1234567')
    @user1.save
    visit new_user_session_path
    fill_in 'login', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end

  it 'should be able to see categories' do
    expect(page).to have_content('Categories')
  end

  it 'should be able to redirect to add new category' do
    click_link 'Add a new category'
    expect(page).to have_current_path(new_user_group_path(@user1))
  end

  it 'should be able to save category' do
    click_link 'Add a new category'
    fill_in 'Name', with: 'Cat 1'
    page.attach_file('group_image', "#{Rails.root}app/assets/images/user.png")
    click_button 'Save'
    expect(page).to have_content('Cat 1')
  end
end
