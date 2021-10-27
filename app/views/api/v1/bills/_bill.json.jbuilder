json.extract! bill,
              :id, :bill_type, :company_id,
              :invoice, :type_invoice, :issuance_date, :invoice_value, :increase,
              :scanning_date, :description, :charts_account_id, :cost_center_id, :discount, :net_value ,
              :salesman_id, :commission, :created_at, :updated_at
json.url api_v1_bill_url(bill, format: :json)
