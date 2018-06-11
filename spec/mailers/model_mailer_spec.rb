require "rails_helper"

RSpec.describe ModelMailer, type: :mailer do
  let(:course){Course.create(name: "excel")}
  let(:user){User.create(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234")}
  let(:teacher){Teacher.create(user: user)}
  let(:group){Group.create(name: "houston", key: "h20", teacher: teacher, course: course)}
  let(:mail){ModelMailer.new_record_notification(user, group)}
 
    it "renders the headers" do
      expect(mail.content).to eq ""
    end
end
