require 'rails_helper'

RSpec.describe SitesController, :type => :controller do

  describe "GET sites#index" do
    it "will respond with 200 to the sites index" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

   describe "GET sites#show" do
    it "will respond with 200 to the sites index" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
