require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create!(name: 'Maxi', email: 'max@gmail.com', password: 'password',
                         password_confirmation: 'password')
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      @user.save
      expect(@user).to be_valid
    end
    it 'Invalid without a name' do
      @user.name = nil
      @user.save
      expect(@user).to be_valid
    end

    it 'Invalid without email' do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'Invalid without password' do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
    end
  end
  context 'associations' do
    it 'has many transactions' do
      assc = described_class.reflect_on_association(:entities)
      expect(assc.macro).to eq :has_many
    end
    it 'has many categories' do
      assc = described_class.reflect_on_association(:groups)
      expect(assc.macro).to eq :has_many
    end
  end
end
