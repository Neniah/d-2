FactoryGirl.define do
  factory :user do
    first_name "Jhon"
    last_name "Doe"
    sequence(:email) { |n| "tester#{n}@example.com" }
    #email "tester@example.com"
    password "dottle-nouveau-pavillion-tights-furze"
  end
end
