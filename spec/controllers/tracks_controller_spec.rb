require 'rails_helper'

RSpec.describe TracksController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "throws a 404 when no track_id is supplied" do
      get :show
      expect(response).to have_http_status(:not_found)
    end

    it "throws a 404 when the track_id supplied is invalid" do
      get :show, params: { id: "invalid" }
      expect(response).to have_http_status(:not_found)
    end

    it "request with type html is sucessfull" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end

    it "request with type xml is successful" do
      get :show, params: { id: 1, format: "xml" }
      expect(response).to have_http_status(:success)
    end
  end

end
