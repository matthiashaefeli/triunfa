# frozen_string_literal: true

require "rails_helper"

RSpec.describe GroupsController, type: :controller do
  let(:user) { User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243") }
  let(:usertwo) { User.create(name: "jon", lastname: "do", email: "jj@jj.com", password: "1243") }
  let(:userthree) { User.create(name: "jon", lastname: "do", email: "jj@a.com", password: "1243") }
  let(:admin) { Admin.create(user: userthree) }
  let(:teacher) { Teacher.create(user: usertwo) }
  let(:course) { Course.create(name: "test") }
  let(:group) { Group.create(name: "group", key: "key", teacher: teacher, course: course) }
  let(:room) { Room.create(group: group) }

  it "render index" do
    create_admin(userthree)
    sign_in(userthree)
    get :index
    expect(response.status).to eq (200)
  end

  it "create a group" do
    create_admin(userthree)
    sign_in(userthree)
    post :create, params: { group: { teacher: teacher,
                                  course: course,
                                  name: "group",
                                  key: "gr" } }
    expect(Group.count).to eq 1
  end

  it "cant create a group (key is nil)" do
    create_admin(userthree)
    sign_in(userthree)
    post :create, params: { group: { teacher: teacher,
                                  course: course,
                                  name: "group",
                                  key: nil } }
    expect(Group.count).to eq 0
  end

  it "render show" do
    create_admin(userthree)
    sign_in(userthree)
    get :show, params: { id: group.id }
    expect(subject).to render_template(:show)
  end

  it "render edit" do
    create_admin(userthree)
    sign_in(userthree)
    put :edit, params: { id: group.id }
    expect(response.status).to eq (204)
  end

  it "update a group" do
    create_admin(userthree)
    create_room(group)
    create_task(user, group)
    sign_in(userthree)
    put :update, params: { id: group.id, group: { teacher: teacher,
                                                course: course,
                                                name: "test",
                                                key: "key",
                                                activ: "0" } }
    expect(group.key).to eq "key"
  end

end
