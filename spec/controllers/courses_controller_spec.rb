require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
    let(:course){Course.create(name: "excel", startdate: "10-01-2018", enddate: "10-02-2018")}
    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    
    it "redirect if user is login" do 
        sign_in(user)
        get  :index
        expect(response.status).to eq (302)
    end

    it "redirect if user is not login" do
        get :index
        expect(response.status).to eq (302)
    end

    it "redirect new" do 
        sign_in(user)
        put :new
        expect(response.status).to eq (302)
    end

    # it "creates a new course" do 
    #     sign_in(user)
    #     post :create, params: {course: {name: "course", startdate: "01-01-2018", enddate: "02-02-2018", link: "link"}}
    #     expect(response.status).to eq (302)
    # end

    it "render show" do 
        sign_in(user)
        get :show, params: {id: course.id}
        expect(response.status).to eq (302)
    end

    it "render edit" do 
        sign_in(user)
        get :edit, params: {id: course.id}
        expect(response.status).to eq (302)
    end

    # it "update a course" do 
    #     sign_in(user)
    #     put :update, params: {id: course.id, course: {name: "hello", startdate: "03-03-2018", enddate: "04-04-2018"}}
    #     expect(response.status).to eq (302)
    # end

    # it "destroy a course" do 
    #     sign_in(user)
    #     get :destroy, params: {id: course.id}
    #     expect(response.status).to eq (302)
    # end



end