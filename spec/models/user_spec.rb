require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    it "has a valid factoty" do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      first_name: 'Maria',
      last_name: 'Lobillo',
      email: 'tester@example.com',
      password: 'dottle-nouveau-pavillion-tights-furze',
    )
    expect(user).to be_valid
  end

  it "is invalid without a fisrt name" do
    user = FactoryGirl.build(:user, first_name: nil)   #FactoryGirl
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end
  it "is invalid without a last name" do
    user = FactoryGirl.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end
  it 'is invalid without an email address' do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it 'is invalid with a duplicate email address' do
    FactoryGirl.create(:user, email: "aaron@example.com")
    user = FactoryGirl.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end
  it 'returns a users full name as a string' do
    user = FactoryGirl.build(:user,
      first_name: 'Jane',
      last_name: 'Tester',
    )
    expect(user.name).to eq 'Jane Tester'
  end

  it "does something with multiple users" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    expect(true).to be true
  end
end
