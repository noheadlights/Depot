def seed_data
  Product.delete_all
  [:product1, :product2, :product3].each do |p|
      FactoryGirl.create(p)
  end
end