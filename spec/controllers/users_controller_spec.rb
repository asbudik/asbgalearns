require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

    it "render the index template" do
      get :index
      expect(response).to render_template("index")
    end


end
