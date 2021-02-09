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

    it "should have a unique email" do
      @user1 = User.new(first_name: "Alison", last_name: "Hussey", email: "alisonhussey@gmail.com", password: "password", password_confirmation: "password")
      @user1.save!
      @user2 = User.new(first_name: "Alison", last_name: "Hussey", email: "ALISONHUSSEY@gmail.com", password: "password", password_confirmation: "password")
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    
    it "should have a password that's at least 8 chars long" do
      @user = User.new(first_name: "Alison", last_name: "Hussey", email: "alisonhussey@gmail.com", password: "pass", password_confirmation: "pass")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it "should be able to log back in with email and password" do
      @user = User.new(first_name: "Alison", last_name: "Hussey", email: "alisonhussey@gmail.com", password: "password", password_confirmation: "password")
      @user.save!
      next_sign_in = User.authenticate_with_credentials("alisonhussey@gmail.com", "password")
      expect(next_sign_in).to eq(@user)      
    end

    it "should not allow signin if email doesn't match" do
      @user = User.new(first_name: "Alison", last_name: "Hussey", email: "alisonhussey@gmail.com", password: "password", password_confirmation: "password")
      @user.save!
      next_sign_in = User.authenticate_with_credentials("alison_hussey@gmail.com", "password")
      expect(next_sign_in).to_not eq(@user)
    end

    


    


  end

end