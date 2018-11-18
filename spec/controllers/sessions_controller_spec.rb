require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "User Login" do
    it "will create a new session" do
      User.authenticate("steph@mail.com", "12341234")

      expect(session[:id]).not_to be_truthy
    end

    it "will log user out" do
      get :destroy
      expect(session[:id]).to be_nil
    end

  end
end
