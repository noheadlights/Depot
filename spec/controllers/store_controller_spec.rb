require 'spec_helper'

describe StoreController do

  describe "GET 'store#index'" do
    before(:each) do
      @p = create(:product1)
    end

    it "returns http success" do
      visit  'index'
      response.should render_template :index
    end
    it "has a product" do
      visit  "index"
      assigns(:products). should eq([@p])
    end
    it "has the title" do
      visit  "index"
      save_and_open_page
      response.should have_content("CoffeeScript")

    end
    it "contains the formatted price" do
      visit  "index"
      response.should have_selector('.price', /\$[.\d]+\.\d\d/)
    end
    it "has the side menu" do
      visit  "index"
      response.should have_selector("a", :minimum => 4)
    end

  end

end
