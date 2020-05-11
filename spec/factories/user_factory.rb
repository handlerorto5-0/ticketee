FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "test#{2*n}@example.com"}
    password "password"

    trait :admin do
      admin true
    end
  end
end
