FactoryBot.define do
  factory :installment do
    name { "MyString" }
    due_date { Date.tomorrow }
    value { 1.5 }
    note { "MyString" }
    bill { create(:invoice_payable) }
    account_bank { create(:account_bank) }
    type_charge { create(:type_charge) }

    trait :installment_receivable do
      discount_due_date {Date.tomorrow}
      discount {8.09}
      notary_title {"MyString"}
      send_date { Date.tomorrow }
      notary_value {1.60}
      protested_title {"MyString"}
      protest_date {Date.tomorrow}
      protest_value {3.50}
      bank_remittance {"MyString"}
      bill { create(:invoice_receivable) }
    end
  end
end
