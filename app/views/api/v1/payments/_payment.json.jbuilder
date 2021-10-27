json.extract! payment, :id, :created_at, :updated_at
json.url api_v1_payment_url(payment, format: :json)
