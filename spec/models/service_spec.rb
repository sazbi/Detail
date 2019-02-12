require 'rails_helper'

RSpec.describe Service, type: :model do
  describe "creation" do
    before do
      @service = Service.create(service_name: "Pinstripe", description: "Apply new pinstripe to vehicle", pay_time: 0.5)
    end
    it "can be created" do
      expect(@service).to be_valid  
    end  

    it "cannot be created without a name and pay" do
      @service.service_name = nil
      @service.pay_time = nil
      expect(@service).to_not be_valid  
    end
    
    
    
  end
  
end
