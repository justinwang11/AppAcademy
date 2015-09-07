FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    password "password"

    factory :other_user do
      username { Faker::Name.name }
    end
  end
end
