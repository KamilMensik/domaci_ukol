require 'rails_helper'

RSpec.describe TaskTag, type: :model do
  it "has a tag" do
    task_tag = create(:task_tag)
    expect(task_tag.save).to be(true)
    task_tag = build(:task_tag, tag:nil)
    expect(task_tag.valid?).to be(false)
  end
  it "has a task" do
    task_tag = create(:task_tag)
    expect(task_tag.save).to be(true)
    task_tag = build(:task_tag, task:nil)
    expect(task_tag.valid?).to be(false)
  end
end
