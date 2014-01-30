require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example User", email: "user@example.com",
                            user_name: "example123", password: "foobar",
                            password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :user_name }
  it { should respond_to :password }
  it { should respond_to :password_digest }
  it { should respond_to :password_confirmation }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when email is blank" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when user_name is taken" do
    before do
      user_with_same_username = @user.dup
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

  describe "when user_name is blank" do
    before { @user.user_name = " " }
    it { should_not be_valid }
  end

  describe "when format is invalid" do
    it "should be invalid" do
      addresses = %w[@bob.com ausers_at_org.org example@. bob@bob. wtf@BOB++.co]
      addresses.each do |email_address|
        @user.email = email_address
        expect(@user).to_not be_valid
      end
    end
  end

  describe "when format is valid" do
    it "should be valid" do
      addresses = %w[bob@bob.com library@clarku.edu example@bbc.co.uk]
      addresses.each do |email_address|
        @user.email = email_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       user_name: "example123", password: " ",
                       password_confirmation: " ")
    end
    it{ should_not be_valid}
  end

  describe "when password and confirmation do not match" do
    before { @user.password_confirmation = "not the password" }
    it { should_not be_valid}
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       user_name: "example123", password: "123",
                       password_confirmation: "123")
    end
    it{ should_not be_valid}
  end
end
