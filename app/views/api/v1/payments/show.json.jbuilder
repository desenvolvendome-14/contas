json.payment do
  json.id @payment.id
  json.pay_date @payment.pay_date
  json.accounting_date @payment.accounting_date
  json.discount_amount @payment.discount_amount
  json.interest_amount @payment.interest_amount
  json.increase_amount @payment.increase_amount
  json.total_amount @payment.total_amount
  json.notary_value @payment.notary_value
  json.protest_value @payment.protest_value
  json.charts_accounts_amount_paid_id @payment.charts_accounts_amount_paid_id
  json.charts_accounts_discount_amount_id @payment.charts_accounts_discount_amount_id
  json.charts_accounts_interest_amount_id @payment.charts_accounts_interest_amount_id
  json.charts_accounts_increase_amount_id @payment.charts_accounts_increase_amount_id
  json.charts_accounts_notary_value_id @payment.charts_accounts_notary_value_id
  json.charts_accounts_protest_value_id @payment.charts_accounts_protest_value_id
end

json.installment @payment.installment_id, :name
json.bill @payment.bill, :invoice, :bill_type
json.account_bank @payment.account_bank, :description
json.document_type @payment.document_type, :description
json.reason_bearish @payment.reason_bearish, :description
