FactoryGirl.define do
  factory :api_key do
    access_token "MyString"
  end

  factory :rankin do
    first_name "Fakey"
    last_name "Rankin"
    birthday "30/12/1974"
    city "Chicago"
    state "IL"
  end
end
