json.installment do
  json.id @installment.id
  json.name @installment.name
  json.note @installment.note
  json.value @installment.value
  json.due_date @installment.due_date
  json.discount @installment.discount
  json.discount_due_date @installment.discount_due_date
  json.notary_title @installment.notary_title
  json.notary_value @installment.notary_value
  json.send_date @installment.send_date
  json.protested_title @installment.protested_title
  json.protest_date @installment.protest_date
  json.protest_value @installment.protest_value
  json.bank_remittance @installment.bank_remittance
end

json.bill @installment.bill, :invoice, :bill_type
json.account_bank @installment.account_bank, :description
json.type_charge @installment.type_charge, :description
