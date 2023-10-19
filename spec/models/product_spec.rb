require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.find_or_create_by! name: 'Household'
    end

    describe 'All Present' do
      before do
        @product = Product.new(:name => 'Spider Plant', :price => 49.85, :quantity => 12, :category => @category)
      end

      it "will save successfully when all fields are present" do
        expect(@product.save)
      end
    end

    describe 'Name Empty' do
      before do
        @product = Product.new(:price => 49.85, :quantity => 12, :category => @category)
      end

      it "will throw an error when name is empty" do
        @product.save
        expect(@product.errors.full_messages).not_to be_empty
      end
    end

    describe 'Price Empty' do
      before do
        @product = Product.new(:name => 'Spider Plant', :quantity => 12, :category => @category)
      end

      it "will throw an error when price is empty" do
        @product.save
        expect(@product.errors.full_messages).not_to be_empty
      end
    end

    describe 'Quantity Empty' do
      before do
        @product = Product.new(:name => 'Spider Plant', :price => 49.85, :category => @category)
      end

      it "will throw an error when quantity is empty" do
        @product.save
        expect(@product.errors.full_messages).not_to be_empty
      end
    end

    describe 'Category Empty' do
      before do
        @product = Product.new(:name => 'Spider Plant', :price => 49.85, :quantity => 12)
      end

      it "will throw an error when category is empty" do
        @product.save
        expect(@product.errors.full_messages).not_to be_empty
      end
    end

  end
end
