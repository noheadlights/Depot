require 'spec_helper'

describe Product do
    
  subject{ create(:product1)}
 
  specify { subject.should validate_presence_of :title }
  specify { subject.should validate_presence_of :description }
  specify { subject.should validate_numericality_of :price }
  specify { subject.should validate_uniqueness_of :title }  
    
  its "price should not be below one cent" do      
    build(:product1, price: 0.0).should_not be_valid
  end
  its "price should be over one cent" do
    build(:product1, price: 10.0).should be_valid
  end
end