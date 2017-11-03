FactoryGirl.define do
  factory :user, aliases: [:owner] do
    first_name "Jhon"
    last_name "Doe"
    sequence(:email) { |n| "tester#{n}@example.com" }
    password "dottle-nouveau-pavillion-tights-furze"
  end
end
