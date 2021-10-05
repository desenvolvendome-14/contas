FactoryBot.define do
  factory :installment do
    name { "MyString" }
    due_date { "2021-10-05" }
    value { 1.5 }
    note { "MyString" }
    bill { create(:invoice_receivable)}
    account_bank { create(:account_bank) }
    type_charge { create(:type_charge)}
  end
end
