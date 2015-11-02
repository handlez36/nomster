FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "randompassword"
    password_confirmation "randompassword"
  end
end

FactoryGirl.define do
  factory :comment do
    message "This is a test comment"
    rating "1_star"
    association :user
    association :place
  end
end

FactoryGirl.define do
  factory :place do
    name "The Crib"
    address "1234 Place Rd"
    description "This is where I live"
    association :user
  end
end