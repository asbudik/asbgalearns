require 'rails_helper'

RSpec.describe ShoutoutsController, :type => :controller do

    it "will create new shoutout" do
      shout = FactoryGirl.build(:shoutout)
      expect(shout.save).to eq(true)
    end

    it "will render error message on create" do
      shout = FactoryGirl.build(:shoutout)
      shout.content = "yoo"
      expect(shout.save).to eq(false)
    end

end
