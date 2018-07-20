require 'spec_helper'
describe "the signin process", type: :feature do
  before :each do
    User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243",
            street: "street", city: "city", state: "state",
            tel: "123", cp: "123", birthdate: "01-01-2018", nationality: "mx")
  end

  it "signs me in" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', with: 'j@j.com'
      fill_in 'user_password', with: 1234
    end
    click_button 'Entrar'
    expect(page).to have_content 'j@j.com'
  end
end

