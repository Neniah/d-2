require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'does not allow duplicate project names per user' do
    user = User.create(
      first_name: 'Joe',
      last_name: 'Tester',
      email: 'tester@example.com',
      password: 'dottle-pavillion'
    )
    user.projects.create(
      name: 'Test Project',
    )
    new_project = user.projects.build(
      name: 'Test Project',
    )
    new_project.valid?
    expect(new_project.errors[:name]).to include('has already been taken')
  end

  it 'allows two users to share a project name' do
    user = FactoryGirl.create(:user)

    user.projects.create(
      name: 'Test Project',
    )
    other_user = FactoryGirl.create(:user)
    other_project = other_user.projects.build(
      name: 'Test Project',
    )
    expect(other_project).to be_valid
  end

  it "can have many notes" do
    project = FactoryGirl.create(:project, :with_notes)
    expect(project.notes.length).to eq 5
  end

  describe "late status" do
    it "is late when the due date is past today" do
      project = FactoryGirl.create(:project, :due_yesterday)
      expect(project).to be_late
    end

    it "is on time when the due date is today" do
      project = FactoryGirl.create(:project, :due_today)
      expect(project).to_not be_late
    end

    it "is on time when the due date is in the future" do
      project = FactoryGirl.create(:project, :due_tomorrow)
      expect(project).to_not be_late
    end
  end
end
