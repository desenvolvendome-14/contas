# frozen_string_literal: true

FactoryBot.define do
  factory :participant do
    name { "MyString" }

    trait :salesman do
      person_type { "salesman" }
    end

    trait :company do
      person_type { "company" }
    end

    trait :client do
      person_type { "client" }
    end

    factory :type_salesman, traits: [:salesman]
    factory :type_company, traits: [:company]
    factory :type_client, traits: [:client]
  end
end
