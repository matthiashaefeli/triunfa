require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243", street: "street", city: "city", state: "state", tel: "123")}

  describe "Get #index" do 
    it "renders the :index view" do
      sign_in(user)
      get :index
      expect(response).to render_template :index
    end
  end

  it "change chat_limit" do 
    get :index, params: {limit: "5"}
    expect(response.status).to eq(200)
  end

  it "Edit User" do 
    get :edituser, params: {id: user.id}
    expect(response.status).to eq(200)
  end

  it "updates the password of an user" do
    create_admin(user)
    sign_in(user)
    create_user
    put :updateuser, params: {id: User.last.id, user: { password: "1234"}}
    expect(User.last.updated_at).to be > User.last.created_at
  end

  it "cant updated the password of an user with letters" do
    create_admin(user)
    sign_in(user)
    create_user
    put :updateuser, params: {id: User.last.id, user: { password: "abc"}}
    expect(User.last.updated_at).to eq User.last.created_at
  end

  it "updates other data of an user" do
    u = create_user
    sign_in(user)
    put :updateuser, params: {id: User.last.id, user: { name: "jon", 
                                                       lastname: "do", 
                                                       email: "j@j.com",     
                                                       street: "street",
                                                       cp: "12345", 
                                                       tel: "123456789", 
                                                       state: "TX", 
                                                       city: "Houston"}}
    expect(User.last.state).to eq "TX"
  end

  it "updatets password from other user" do 
    put :updatepassword, params: {id: user.id}
    expect(response.status).to eq(200)
  end

  it "redirect if user admin online status is changed after logout" do 
    create_user
    create_admin(create_user)
    admin = create_admin(user)
    admin.online = true
    admin.save
    sign_in(user)
    get :destroy, params: {id: User.last.id}
    expect(Admin.last.online).to eq false
  end

  it "redirect if user student online status is changed after logout" do 
    create_student(user)
    sign_in(user)
    get :destroy, params: {id: user.id}
    expect(response.status).to eq(302) 
  end

  it "redirect if user teacher online status is changed after logout" do 
    teacher = create_teacher(user)
    teacher.online = true
    teacher.save
    sign_in(user)
    get :destroy, params: {id: user.id}
    expect(Teacher.last.online).to eq false
  end

  it "redirect if user is new_user" do 
    sign_in(user)
    get :destroy, params: {id: user.id}
    expect(response.status).to eq(302) 
  end

end