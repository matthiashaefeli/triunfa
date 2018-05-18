require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

    let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243")}
    let(:usertwo){User.create(name: "jon", lastname: "do", email: "jj@jj.com", password: "1243")}
    let (:teacher){Teacher.create(user: usertwo)}
    let (:course){Course.create(name: "test", startdate: "01-01-2018", enddate: "02-02-2018")}

    let (:group){Group.create(name: "group", key: "key", teacher: teacher, course: course)}
    let (:room){Room.create(group: group)}

    it "redirect if user is not login" do
        post :create, params: {room: room.id}
        expect(response.status).to eq(302)
    end

    it "redirect after creates a message" do
        sign_in(user)
        post :create, params: {room: room.id, message: {body: "hello"}}
        expect(response.status).to eq (204)
    end



end


