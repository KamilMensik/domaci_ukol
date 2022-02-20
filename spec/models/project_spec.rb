require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a title" do
    project = create(:project)
    expect(project.save).to be(true)
    project = build(:project, title:nil)
    expect(project.valid?).to be(false)
  end
  it "has a position" do
    project = create(:project)
    expect(project.save).to be(true)
    project = build(:project, position:nil)
    expect(project.valid?).to be(false)
  end
  it "has a user" do
    project = create(:project)
    expect(project.save).to be(true)
    project = build(:project, user_id:nil)
    expect(project.valid?).to be(false)
  end
end
