FactoryGirl.define do
  factory :api_key do
    access_token "MyString"
  end

  factory :rankin do
    first_name "Fakey"
    last_name "Rankin"
  end
end
