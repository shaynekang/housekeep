FactoryGirl.define do
  factory :user do
    provider "twitter"
    uid  "37"
    name "John Doe"
    email "john.doe@gmail.com"
  end

  trait :john do
    provider "twitter"
    uid  "38"
    name "John Doe"
  end

  trait :park do
    provider "facebook"
    uid  "24"
    name "Park Park"
  end


  factory :book do
    user
    title "Alice in the Wonderland"
  end

  factory :transaction do
    book
    amount 10
    note "salary"
  end
end