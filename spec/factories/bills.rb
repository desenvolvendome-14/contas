# frozen_string_literal: true

FactoryBot.define do
  factory :bill do
    company_id { 1 }
    invoice { "MyString" }
    type_invoice { 1 }
    issuance_date { "2021-09-15" }
    invoice_value { 1.5 }
    increase { 1.5 }

    trait :invoice_receivable do
      bill_type { "invoice_receivable" }
      salesman_id { 1 }
      commission { 1.5 }
    end

    trait :invoice_payable do
      bill_type { "invoice_payable" }
      scanning_date { Date.today }
      description { "MyString" }
      account_plan_id { 1 }
      cost_center_id { 1 }
      discount { 1.5 }
      net_value { 5.9 }
    end

    trait :expense_payable do
      bill_type { "expense_payable" }
      scanning_date { Date.today }
      description { "MyString" }
      account_plan_id { 1 }
      cost_center_id { 1 }
      discount { 1.5 }
      net_value { 5.9 }
    end

    factory :expense_payable, traits: [:expense_payable]
    factory :invoice_payable, traits: [:invoice_payable]
    factory :invoice_receivable, traits: [:invoice_receivable]
  end
end
