FactoryGirl.define do
  factory :user do
    name      "Test User"
    email     "test@example.com"
    user_name "test123"
    password  "foobar"
    password_confirmation "foobar"
  end
end
