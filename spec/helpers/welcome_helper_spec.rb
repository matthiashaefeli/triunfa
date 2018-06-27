# frozen_string_literal: true

require "rails_helper"


RSpec.describe WelcomeHelper, type: :helper do
  setup do
    @user = User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")
    @usertwo = User.create(name: "jon", lastname: "do", email: "j@kj.com", password: "1243")
    @userthree = User.create(name: "jon", lastname: "do", email: "it@juntospodemos.org", password: "1243")
    @userfour = User.create(name: "jon", lastname: "do", email: "h@h.com", password: "1243")
    @userfive = User.create(name: "jon", lastname: "do", email: "h@h.com", password: "1243")
    @admin = Admin.create(user: @user, super: false, online: true)
    @admintwo = Admin.create(user: @userfive, super: false, online: false)
    teacher = Teacher.create(user: @usertwo, online: true)
    course = Course.create(name: "excel")
    group = Group.create(name: "group", key: "key", teacher: teacher, course: course)
    student = Student.create(user: @userthree, group: group, online: true)
  end

  describe "all_users" do
    it "returns an empty array" do
      expect(all_users.length).to eq 3
    end
  end

  describe "check_user" do
    it "returns Admin if the user is a admin" do
      expect(check_user(@user)).to eq Admin
    end

    it "returns Teacher if the user is a teacher" do
      expect(check_user(@usertwo)).to eq Teacher
    end

    it "returns Student if the user is a student" do
      expect(check_user(@userthree)).to eq Student
    end

    it "returns new_user if the user is a new user" do
      expect(check_user(@userfour)).to eq "new_user"
    end
  end

  describe "update_online" do
    it "updates a status of a user" do
      allow(helper).to receive(:current_user).and_return(@user)
      helper.update_online(Admin)
      expect(@admin.online).to eq true
    end
  end

  describe "online" do
    it "returns a user" do
      allow(helper).to receive(:current_user).and_return(@user)
      expect(helper.online).to eq @admin
    end
  end
end
