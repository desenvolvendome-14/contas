class Rateio < ApplicationRecord
  has_many :bills
  has_many :account_plans

  enum bill_type: [:invoice_receivable, :invoice_payable, :expense_payable]

  validates :value_rateio, :obs, presence: true
end
