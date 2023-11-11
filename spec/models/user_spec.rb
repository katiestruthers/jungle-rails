require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    describe "All Present" do
      it "will save successfully when all fields are present & passwords match" do
        @user = User.new(:first_name => 'Katie', :last_name => 'Struthers', :email => 'a@a.com', :password => 'test123', :password_confirmation => 'test123')
        expect(@user.save)
      end

      it "will throw an error when passwords do not match" do
        @user = User.new(:first_name => 'Katie', :last_name => 'Struthers', :email => 'a@a.com', :password => 'test123', :password_confirmation => 'test456')
        @user.save
        expect(@user.errors.full_messages).not_to be_empty
      end
    end

    describe "Password Empty" do
      it "will throw an error when password is empty" do
        @user = User.new(:first_name => 'Katie', :last_name => 'Struthers', :email => 'a@a.com', :password_confirmation => 'test456')
        @user.save
        expect(@user.errors.full_messages).not_to be_empty
      end

      it "will throw an error when password confirmation is empty" do
        @user = User.new(:first_name => 'Katie', :last_name => 'Struthers', :email => 'a@a.com', :password => 'test456')
        @user.save
        expect(@user.errors.full_messages).not_to be_empty
      end
    end

    describe "Name Empty" do
      it "will throw an error when first name is empty" do
        @user = User.new(:last_name => 'Struthers', :email => 'a@a.com', :password => 'test123', :password_confirmation => 'test123')
        @user.save
        expect(@user.errors.full_messages).not_to be_empty
      end

      it "will throw an error when last name is empty" do
        @user = User.new(:first_name => 'Katie', :email => 'a@a.com', :password => 'test123', :password_confirmation => 'test123')
        @user.save
        expect(@user.errors.full_messages).not_to be_empty
      end
    end

    describe "Email Empty" do
      it "will throw an error when email is empty" do
        @user = User.new(:first_name => 'Katie', :last_name => 'Struthers', :password => 'test123', :password_confirmation => 'test123')
        @user.save
        expect(@user.errors.full_messages).not_to be_empty
      end
    end

    describe "Unique Email" do
      it "will throw an error when attempt to save a duplicate email (case insensitve)" do
        @user1 = User.new(:first_name => 'Katie', :last_name => 'Struthers', :email => 'a@a.com', :password => 'test123', :password_confirmation => 'test123')
        @user2 = User.new(:first_name => 'John', :last_name => 'Doe', :email => 'A@A.COM', :password => 'test123', :password_confirmation => 'test123')
        @user1.save
        @user2.save
        expect(@user2.errors.full_messages).not_to be_empty
      end
    end

    describe "Password Minimum Length" do
      it "will throw an error when password is less than 5 characters" do
        @user = User.new(:first_name => 'Katie', :last_name => 'Struthers', :email => 'a@a.com', :password => 'test', :password_confirmation => 'test')
        @user.save
        expect(@user.errors.full_messages).not_to be_empty
      end
    end
  end

  describe '.authenticate_with_credentials' do
    it "will return an instance of the user if successfully authenticed" do
      @user = User.new(:first_name => 'Katie', :last_name => 'Struthers', :email => 'a@a.com', :password => 'test123', :password_confirmation => 'test123')
      @user.save
      @userInstance = User.create(:email => 'a@a.com', :password => 'test123')
      expect(@userInstance)
    end

    it "will return an instance of the user even with white space before or after email" do
      @user = User.new(:first_name => 'Katie', :last_name => 'Struthers', :email => 'a@a.com', :password => 'test123', :password_confirmation => 'test123')
      @user.save
      @userInstance = User.create(:email => '   a@a.com   ', :password => 'test123')
      expect(@userInstance)
    end

    it "will return an instance of the user even in wrong case for email" do
      @user = User.new(:first_name => 'Katie', :last_name => 'Struthers', :email => 'a@a.com', :password => 'test123', :password_confirmation => 'test123')
      @user.save
      @userInstance = User.create(:email => 'A@a.com', :password => 'test123')
      expect(@userInstance)
    end
  end
end
