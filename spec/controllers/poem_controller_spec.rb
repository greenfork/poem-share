require 'rails_helper'

RSpec.describe PoemController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    context "with the valid hash" do
      it "returns http success" do
        get :show, params: { hash: 'aA==' }
        expect(response).to have_http_status(:success)
      end
    end

    context "with the invalid hash" do
      it "returns an error" do
        get :show, params: { hash: 'abcaa' }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST #create" do
    it "redirects to #show if successful" do
      post :create, params: { poem: 'h' }
      expect(response).to redirect_to(action: :show, hash: 'aA==')
    end
  end
end
