require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create!(name: 'Max', email: 'max@gmail.com', password: 'password',
                         password_confirmation: 'password')
    @group = Group.new(name: 'group one', user_id: @user.id)
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      @group.save
      expect(@group).to be_valid
    end
    it 'Invalid without a name' do
      expect(Group.new).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many payments' do
      assc = described_class.reflect_on_association(:entities)
      expect(assc.macro).to eq :has_many
    end
    it 'belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
