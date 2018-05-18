require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    let(:usertwo){User.create(name: "jon", lastname: "do", email: "jj@jj.com", password: "1243")}
    let (:teacher){Teacher.create(user: usertwo)}
    let (:course){Course.create(name: "test", startdate: "01-01-2018", enddate: "02-02-2018")}
    let (:group){Group.create(name: "group", key: "key", teacher: teacher, course: course)}

    it "render index" do 
        sign_in(user)
        get :index
        expect(response.status).to eq (302)
    end

    # it "create a group" do 
    #     sign_in(user)
    #     post :create, params: {group: {teacher: teacher, course: course, name: "group", key: "gr"}}
    #     expect(response.status).to eq (302)
    # end

    it "render show" do 
        sign_in(user)
        get :show, params: {id: group.id}
        expect(subject).to render_template(:show)
    end

    it "render edit" do 
        sign_in(user)
        put :edit, params: {id: group.id}
        expect(response.status).to eq (302)
    end

    # it "update a group" do 
    #     sign_in(user)
    #     put :update, params: {id: group.id, group: {teacher: teacher, course: course, name: 'test', key: "key"}}
    #     expect(response.status).to eq (302)
    # end

end