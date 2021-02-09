require 'rails_helper'

# RSpec.describe Product, type: :model do
#   describe 'Validations' do
#     it "should save a product with all four fields set" do
#       @category = Category.new(name: "Awesomeness")
#       @product = Product.new(name: "Jeans", price_cents: 9000, quantity: 13, category: @category)
#       @product.save!
#       expect(@product).to be_valid
#     end

#     it "should not save a product without a name" do
#       @category = Category.new(name: "Awesomeness")
#       @product = Product.new(name: nil, price_cents: 9000, quantity: 13, category: @category)
#       expect(@product).to_not be_valid
#       expect(@product.errors.full_messages).to include("Name can't be blank")
#     end

#     it "should not save a product without a price" do
#       @category = Category.new(name: "Awesomeness")
#       @product = Product.new(name: "Jeans", price_cents: nil, quantity: 13, category: @category)
#       expect(@product).to_not be_valid
#       expect(@product.errors.full_messages).to include("Price can't be blank")
#     end

#     it "should not save a product without a quantity" do
#       @category = Category.new(name: "Awesomeness")
#       @product = Product.new(name: "Jeans", price_cents: 9000, quantity: nil, category: @category)
#       expect(@product).to_not be_valid
#       expect(@product.errors.full_messages).to include("Quantity can't be blank")
#     end

#     it "should not save a product without a category" do
#       @product = Product.new(name: "Jeans", price_cents: 9000, quantity: 13, category: nil)
#       expect(@product).to_not be_valid
#       expect(@product.errors.full_messages).to include("Category can't be blank")
#     end

#   end
# end
