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

    


  end
end