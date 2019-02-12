require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @store = Store.create(name: "Infiniti of Melbourne")
      @user = User.create(username: "jsnow", email: "jsnow@bonifacehiers.com", first_name: 'Jon', last_name: 'Snow', password: "asdfasdf", password_confirmation: "asdfasdf", store_ids: [@store.id])
      @service1 = Service.create(service_name: "clay bar", pay_time: 1.0)
      @service2 = Service.create(service_name: "Service Wash", pay_time: 0.3)
      @service3 = Service.create(service_name: "New Car Delivery", pay_time: 0.5)
      @service4 = Service.create(service_name: "Tint Removal", pay_time: 1.0)
      @post = Post.create(stk_num: "X9999", user_id: @user.id, service_ids: [@service1.id, @service2.id, @service3.id, @service4.id], store_id: @user.stores.first.id)
    end
    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot have no services" do
      @post.service_ids = nil
      expect(@post).to_not be_valid
    end
    

    it "must have a stock number entered" do
      @post.stk_num = nil
      expect(@post).to_not be_valid
    end
    
    
    
  end
  
end
