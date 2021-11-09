json.array! @installments do | installment|
  json.id installment.id
  json.name installment.name
  json.due_date installment.due_date
  json.value installment.value
end
