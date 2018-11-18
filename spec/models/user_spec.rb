require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "User CRUD" do
    it "will create a user" do
      user = FactoryGirl.build(:user)
      expect(user.save).to eq(true)
    end

    it "will validate an email" do
      user = FactoryGirl.build(:user)
      user.email = "1234@boblaw"
      expect(user.save).to eq(false)
    end

    it "will render error message on create" do
      user = FactoryGirl.build(:user)
      user.password = "1234"
      expect(user.save).to eq(false)
    end

    it "will update a user" do
      user = FactoryGirl.create(:user)
      expect(user.update(email: "adam@gmail.com", first_name: "Adam")).to eq(true)
    end

    it "will render an error and not update a user" do
      user = FactoryGirl.create(:user)
      expect(user.update(email: "adam@gmcom", first_name: "Adam")).to eq(false)
    end
  end

end
