json.extract! installment, :id, :bill, :account_bank, :type_charge, :due_date,:note, :value :created_at, :updated_at
json.url api_v1_installment_url(installment, format: :json)
