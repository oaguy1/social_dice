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

  describe "when email is taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
end
