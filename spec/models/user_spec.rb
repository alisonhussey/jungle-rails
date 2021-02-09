require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should save a new user with all fields set" do
      @user = User.new(first_name: "Alison", last_name: "Hussey", email: "alisonhussey@gmail.com", password: "password", password_confirmation: "password")
      @user.save!
      expect(@user).to be_valid
    end

    it "should not save a user without a matching password_confirmation" do
      @user = User.new(first_name: "Alison", last_name: "Hussey", email: "alisonhussey@gmail.com", password: "password", password_confirmation: "wordpass")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should not save a user without a first name" do
      @user = User.new(first_name: nil, last_name: "Hussey", email: "alisonhussey@gmail.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
  
    it "should not save a user without a last name" do
      @user = User.new(first_name: "Alison", last_name: nil, email: "alisonhussey@gmail.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should not save a user without an email" do
      @user = User.new(first_name: "Alison", last_name: "Hussey", email: nil, password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end


  end
end