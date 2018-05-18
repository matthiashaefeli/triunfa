require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    let(:usertwo){User.create(name: "jon", lastname: "do", email: "jk@j.com", password: "1243")}
    let(:teacher){Teacher.create(user: usertwo)}

    it "render index" do 
        sign_in(user)
        get :index
        expect(subject).to render_template(:index)
    end

    it "render index with more messages" do 
        sign_in(user)
        get :index, params: {limit: 10}
        expect(subject).to render_template(:index)
    end

    # it "creates a new teacher" do
    #     sign_in(user)
    #     post :create, params: {teacher: {name: "jeff", lastname: "do", email: "jeff@test.com", password: 1234}}
    #     expect(response.status).to eq (302)
    # end

    it "render show" do 
        sign_in(user)
        get :show, params: {id: teacher.id}
        expect(response.status).to eq (302)
    end

    it "updates a teacher" do 
        sign_in(user)
        put :update, params: {id: teacher.id, user: {name: "john", lastname: "doo", email: "jk@j.com"}}
        expect(response.status).to eq (302)
    end

    # it "deasctivate a teacher" do 
    #     sign_in(user)
    #     get :destroy, params: {id: teacher.id}
    #     expect(response.status).to eq (302)
    # end


end