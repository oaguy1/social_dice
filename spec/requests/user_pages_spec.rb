require 'spec_helper'

describe "Users Pages" do

  subject { page }

  describe "signup_page" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    it { should have_content "Sign up" }
    it { should have_title "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.to_not change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "User name",    with: "example123"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "user page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path user }

    it { should have_content user.name }
    it { should have_title user.name }
  end
end
