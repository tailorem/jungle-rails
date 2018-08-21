require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do
    it "should be valid with valid attributes" do
    @test_category = Category.new(name: "Test Things")
    @test_product = Product.new(name: "Test Product", price: 29.99, quantity: 4, category: @test_category)
      expect(@test_product).to be_valid
    end

    it "should not be valid without a valid name" do
      @test_category = Category.new(name: "Test Things")
      @test_product = Product.new(price: 29.99, quantity: 4, category: @test_category)
      expect(@test_product).to_not be_valid
      expect(@test_product.errors.full_messages).to include("Name can't be blank")
    end
    it "should not be valid without a valid price" do
      @test_category = Category.new(name: "Test Things")
      @test_product = Product.new(name: "Test Product", quantity: 4, category: @test_category)
      expect(@test_product).to_not be_valid
      expect(@test_product.errors.full_messages).to include("Price can't be blank")
    end
    it "should not be valid without a valid quantity" do
      @test_category = Category.new(name: "Test Things")
      @test_product = Product.new(name: "Test Product", price: 29.99, category: @test_category)
      expect(@test_product).to_not be_valid
      expect(@test_product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "should not be valid without a valid category" do
      @test_category = Category.new(name: "Test Things")
      @test_product = Product.new(name: "Test Product", price: 29.99, quantity: 4)
      expect(@test_product).to_not be_valid
      expect(@test_product.errors.full_messages).to include("Category can't be blank")
    end
  end
end


# Using subject
# RSpec.describe Product, type: :model do
#   category = Category.new(name: "Test Things")
#   subject { Product.new(name: "Test Product", price: 29.99, quantity: 4, category: category) }

#   describe "Validations" do
#     it "should be valid with valid attributes" do
#       expect(subject).to be_valid
#     end

#     it "should not be valid without a valid name" do
#       subject.name = nil
#       expect(subject).to_not be_valid
#     end
#     it "should not be valid without a valid price" do
#       subject.price_cents = nil
#       expect(subject).to_not be_valid
#     end
#     it "should not be valid without a valid quantity" do
#       subject.quantity = nil
#       expect(subject).to_not be_valid
#     end
#     it "should not be valid without a valid category" do
#       subject.category = nil
#       expect(subject).to_not be_valid
#     end
#   end
# end


# describe '#id' do
#   it 'should not exist for new records' do
#     @widget = Widget.new
#     expect(@widget.id).to be_nil
#   end

#   it 'should be auto-assigned by AR for saved records' do
#     @widget = Widget.new
#     # we use bang here b/c we want our spec to fail if save fails (due to validations)
#     # we are not testing for successful save so we have to assume it will be successful
#     @widget.save!

#     expect(@widget.id).to be_present
#   end
# end