FactoryBot.define do
  factory :link do
    title { "Ruby Together" }
    url { "https://rubytogether.org/" }

    trait :invalid do
      title { nil }
    end
  end
end
