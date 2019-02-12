require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(username: "jsnow", email: "jsnow@bonifacehiers.com", first_name: 'Jon', last_name: 'Snow', password: "asdfasdf", password_confirmation: "asdfasdf")
    end

    it "can be created" do
      expect(@user).to be_valid  
    end

    it "cannot be completed without a first and last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid  
    end
    
    
  end
  
  

end
