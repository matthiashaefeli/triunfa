require "rails_helper"

RSpec.describe TodosController, type: :controller do
  let(:user){User.create(name: "jon", lastname: "do", email: "j@j.com", password: "1243", 
                          street: "street", city: "city", state: "state", tel: "123")}

  it "will not render if user is not login" do 
    get :index
    expect(response.status).to eq (302)
  end

  it "render index if user is login" do 
    sign_in(user)
    get :index
    expect(subject).to render_template(:index)
  end

  it "create a new todo" do 
    sign_in(user)
    post :create, params: {todo: {name: "todo"}}
    expect(Todo.count).to eq 1
  end

  it "update a todo" do 
    sign_in(user)
    post :create, params: {todo: {name: "todo"}}
    put :update, xhr: true, params: {id: Todo.last.id}
    expect(Todo.last.done).to eq false
  end

  it "delete a todo" do 
    sign_in(user)
    post :create, params: {todo: {name: "todo"}}
    delete :destroy, params: {id: Todo.last.id}
    expect(Todo.count).to eq 0
  end

end
