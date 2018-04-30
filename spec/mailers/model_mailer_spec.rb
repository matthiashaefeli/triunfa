require "rails_helper"

RSpec.describe ModelMailer, type: :mailer do
  let(:course){Course.new(name: "excel", start: "01-02-2018 10:10:10", end: "02-02-2018 10:10:10")}
  let(:user){User.new(name: "teacher", lastname: "bosa", email: "bosa@test.com", password: "1234")}
  let(:teacher){Teacher.new(user: user)}
  let(:group){Group.new(name: "houston", key: "h20", teacher: teacher, course: course)}

  # describe "new_record_notification" do
  #   let(:mail){ModelMailer.new_record_notification(user, group)}

  #   it "renders the headers" do
  #     expect(mail.subject).to eq("Bienvenido")
  #     expect(mail.to).to eq(["bosa@test.com"])
  #     expect(mail.from).to eq(["from@example.com"])
  #   end

  # end

end
