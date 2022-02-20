require 'rails_helper'

RSpec.describe Tag, type: :model do
   it "has a title" do
    tag = create(:tag)
    expect(tag.save).to be(true)
    tag = build(:tag, title:nil)
    expect(tag.valid?).to be(false)
  end
  it "has a user" do
    tag = create(:tag)
    expect(tag.save).to be(true)
    tag = build(:tag, user_id:nil)
    expect(tag.valid?).to be(false)
  end
end
