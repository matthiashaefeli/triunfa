require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:course){Course.create(name: "excel", startdate: "10-01-2018", enddate: "10-02-2018")}
  let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    
  it "response 200 if user is login" do 
    create_admin(user)
    sign_in(user)
    get  :index
    expect(response.status).to eq (200)
  end

  it "redirect if user is not login" do
    get :index
    expect(response.status).to eq (302)
  end

  it "redirect if user is login but not admin or teacher" do
    sign_in(user)
    get :index
    expect(response.status).to eq (302)
  end

  it "redirect new if user is not admin" do 
    sign_in(user)
    put :new
    expect(response.status).to eq (302)
  end

  it "response 200 if user is admin" do 
    create_admin(user)
    sign_in(user)
    put :new
    expect(response.status).to eq (204)
  end

  it "creates a new course" do 
    create_admin(user)
    sign_in(user)
    post :create, params: {course: {name: "course", link: "link"}}
    expect(Course.count).to eq 1
  end

  it "cant creates a new course" do 
    create_admin(user)
    sign_in(user)
    post :create, params: {course: {name: nil, link: "link"}}
    expect(Course.count).to eq 0
  end

  it "render show" do 
    create_admin(user)
    sign_in(user)
    get :show, params: {id: course.id}
    expect(response.status).to eq (200)
  end

  it "redirect if user is not login" do 
    get :show, params: {id: course.id}
    expect(response.status).to eq (302)
  end

  it "redirect if user is not admin" do 
    sign_in(user)
    get :edit, params: {id: course.id}
    expect(response.status).to eq (302)
  end

  # it "response 200 if user is admin" do 
  #   create_admin(user)
  #   sign_in(user)
  #   create_course
  #   get :edit, params: {id: Course.last.id}
  #   expect(response.status).to eq (302)
  # end

  it "update a course" do 
    create_admin(user)
    sign_in(user)
    create_course
    put :update, params: {id: Course.last.id, course: {name: "hello"}}
    expect(Course.last.name).to eq "hello"
  end

  it "destroy a course" do 
    create_admin(user)
    sign_in(user)
    create_course
    get :destroy, params: {id: Course.last.id}
    expect(Course.count).to eq 0
  end

  # it "download a course" do 
  #   create_admin(user)
  #   sign_in(user)
  #   create_course
  #   get :download, params: {id: Course.last.id}
  #   expect(response.status).to eq (200)
  # end
end