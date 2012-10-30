require 'spec_helper'

describe "Store" do

  describe "GET 'store#index'", :type => :request do
    before(:each) do
      @p = create(:product1)
    
    end

    it "has the title" do
      visit  root_path
      within "h3" do
        page.should have_content("CoffeeScript")
      end
    end
    it "contains the formatted price" do
      visit  root_path
      page.should have_selector('.price')
    end
    it "has the side menu" do
      visit  root_path
      page.should have_selector("a", :minimum => 4)
    end

  end

end
