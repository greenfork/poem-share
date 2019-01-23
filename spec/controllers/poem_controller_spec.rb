require 'rails_helper'

RSpec.describe PoemController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { hash: '123abcABC' }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      post :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #error" do
    it "returns http success" do
      get :error, params: { other: '(123abc' }
      expect(response).to have_http_status(:success)
    end
  end

end
