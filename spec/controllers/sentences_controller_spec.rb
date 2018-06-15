require 'rails_helper'

RSpec.describe SentencesController, type: :controller do
  let(:user){User.create(name: 'john', lastname: 'do', email: 'j@j.com', password: '1234')}

  it 'creates a new sentence' do
    create_admin(user)
    sign_in(user)
    post :create, params: {sentence: { title: 'title', body: 'body'}}
    expect(Sentence.count).to eq 1
  end

  it 'cant create a sentence if user is not login' do 
    post :create, params: {sentence: { title: 'title', body: 'body'}}
    expect(Sentence.count).to eq 0
  end

  it 'cant create a sentence if user is not admin' do 
    sign_in(user)
    post :create, params: {sentence: { title: 'title', body: 'body'}}
    expect(Sentence.count).to eq 0
  end

  it 'update the sentence' do 
    create_admin(user)
    sign_in(user)
    post :create, params: {sentence: { title: 'title', body: 'body'}}
    get :update, params: {id: Sentence.last.id, sentence: { title: 'yes', body: 'hello'}}
    expect(Sentence.last.title).to eq 'yes'
  end

end
