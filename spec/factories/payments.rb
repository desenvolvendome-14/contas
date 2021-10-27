FactoryBot.define do
  factory :payment do
    pay_date { "2021-10-26" }
    accounting_date { "2021-10-26" }
    amount_paid { 1.5 }
    discount_amount { 0.3 }
    interest_amount { 1.5 }
    increase_amount { 4 }
    total_amount { 1.5 }
    charts_accounts_amount_paid { create(:charts_account) }
    charts_accounts_discount_amount { create(:charts_account) }
    charts_accounts_interest_amount { create(:charts_account) }
    charts_accounts_increase_amount { create(:charts_account) }
    bill { create(:invoice_payable) }
    installment { create(:installment) }
    reason_bearish { create(:reason_bearish) }
    document_type { create(:document_type) }
    account_bank { create(:account_bank) }
  end
end
