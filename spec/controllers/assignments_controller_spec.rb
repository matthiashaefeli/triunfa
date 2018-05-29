require 'rails_helper'

RSpec.describe AssignmentsController, type: :controller do

  let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
  let(:usertwo){User.create(name: "jon", lastname: "do", email: "jj@jj.com", password: "1243")}
  let (:teacher){Teacher.create(user: usertwo)}
  let (:course){Course.create(name: "test", startdate: "01-01-2018", enddate: "02-02-2018")}

  let (:group){Group.create(name: "group", key: "key", teacher: teacher, course: course)}
  let (:room){Room.create(group: group)}
  let (:assignment){Assignment.create(course: course, name: "ass", points: 10)}

  it "show a assignment" do 
    create_admin(user)
    sign_in(user)
    get :show, params: {id: assignment.id, group: group.id}
    expect(subject).to render_template(:show)
  end

  it "destroy a assignment" do
    sign_in(user)
    create_assignment(course)
    get :destroy, params: {id: Assignment.last.id, group: group.id}
    expect(Assignment.count).to eq 0
  end

  it "creates a new assignment" do
    sign_in(user)
    post :create, params: {course: course.id, assignment: {name: "ass", points: 10}}
    expect(Assignment.count).to eq 1
  end
end
