FactoryGirl.define do
  factory :goal do
    title { Faker::Hacker.say_something_smart }
    association :user, factory: :user
    privacy { [true, false].sample }
    completion { [true, false].sample }

    factory :private_completed_goal do
      association :user, factory: :other_user
      privacy true
      completion true
    end

    factory :private_incomplete_goal do
      association :user, factory: :other_user
      privacy true
      completion false
    end

    factory :public_completed_goal do
      association :user, factory: :other_user
      privacy false
      completion true
    end

    factory :public_incomplete_goal do
      association :user, factory: :other_user
      privacy false
      completion false
    end
  end
end
