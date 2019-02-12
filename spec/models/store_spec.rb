require 'rails_helper'

RSpec.describe Store, type: :model do
  describe "creation" do
    before do
      @store = Store.create(name: "Boniface Hiers Kia")
    end
    it "can be created" do
      expect(@store).to be_valid  
    end

    it "cannot be created without a name" do
      @store.name = nil
      expect(@store).to_not be_valid
    end
    
    
    
  end
  
end
