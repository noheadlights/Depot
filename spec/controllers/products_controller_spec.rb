require 'spec_helper'

describe ProductsController, type: :controller do


  before :each do
    @p=create(:product1)
  end
  describe 'GET #index' do    
    it "populates an array of products" do        
      get :index
      assigns(:products).should eq([@p])
    end
  
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  describe 'GET #new' do
    it "assigns a new Product to product" do
      get :new
      assigns(:product).should be_a_new(Product)
    end
    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end
  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new product" do
        expect{
          post :create, product: attributes_for(:product2)
        }.to change(Product,:count).by(1)
      end

      it "redirects to the new contact" do
        post :create, product: attributes_for(:product2)
        response.should redirect_to Product.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact" do
        expect{
          post :create, product: attributes_for(:invalid_product)
        }.to_not change(Product,:count)
      end

      it "re-renders the new method" do
        post :create, product: attributes_for(:invalid_product)
        response.should render_template :new
      end
    end 
  end    
  describe 'PUT #update' do
    context "valid attributes" do
      it "located the requested contact" do
        put :update, id: @p, product: attributes_for(:product2)
        assigns(:product).should eq(@p)      
      end

      it "changes contact's attributes" do
        put :update, id: @p, 
          product: attributes_for(:product1, 
            title: "Larry")
        @p.reload
        @p.title.should eq("Larry")
        
      end

      it "redirects to the updated contact" do
        put :update, id: @p, product: attributes_for(:product2)
        response.should redirect_to @p
      end
    end

    context "invalid attributes" do
      it "locates the requested contact" do
        put :update, id: @p, product: attributes_for(:invalid_product)
        assigns(:product).should eq(@p)      
      end

      it "does not change contact's attributes" do
        put :update, id: @p, 
          product: attributes_for(:product1, 
            title:  nil, price: 10)
        @p.reload
        @p.price.should_not eq(10)
        @p.title.should eq("CoffeeScript")
      end

      it "re-renders the edit method" do
        put :update, id: @p, product: attributes_for(:invalid_product)
        response.should render_template :edit
      end
    end
  end



end

