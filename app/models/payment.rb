class Payment < ApplicationRecord
  belongs_to :bill
  belongs_to :installment
  belongs_to :reason_bearish
  belongs_to :document_type
  belongs_to :account_bank
  belongs_to :charts_accounts_amount_paid, class_name: 'ChartsAccount', required: true
  belongs_to :charts_accounts_discount_amount, class_name: 'ChartsAccount'
  belongs_to :charts_accounts_interest_amount, class_name: 'ChartsAccount'
  belongs_to :charts_accounts_increase_amount, class_name: 'ChartsAccount'
end
