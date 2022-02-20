require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a title" do
    task = create(:task)
    expect(task.save).to be(true)
    task = build(:task, title:nil)
    expect(task.valid?).to be(false)
  end
  it "has a user" do
    task = create(:task)
    expect(task.save).to be(true)
    task = build(:task, user_id:nil)
    expect(task.valid?).to be(false)
  end
  it "has a is_done field" do
    task = create(:task)
    expect(task.save).to be(true)
    task = build(:task, is_done:nil)
    expect(task.valid?).to be(false)
  end
  it "shows tags" do
    user = create(:user,id:1)
    task = create(:task,user_id:1)
    task.tags.new(title:"Tag1",user_id:1)
    task.tags.new(title:"Tag2",user_id:1)
    expect(task.show_tags).to be==("Tag1 Tag2 ")
  end
end
