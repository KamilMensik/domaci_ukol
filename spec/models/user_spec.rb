require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a first name" do
    user = create(:user)
    expect(user.save).to be(true)
    user = build(:user, first_name:nil)
    expect(user.valid?).to be(false)
  end
  it "has a surname" do
    user = create(:user)
    expect(user.save).to be(true)
    user = build(:user, surname:nil)
    expect(user.valid?).to be(false)
  end
  it "has a email" do
    user = create(:user)
    expect(user.save).to be(true)
    user = build(:user, email:nil)
    expect(user.valid?).to be(false)
  end
  it "has a password" do
    user = create(:user)
    expect(user.save).to be(true)
    user = build(:user, password:nil)
    expect(user.valid?).to be(false)
  end
end
