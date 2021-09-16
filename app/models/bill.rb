class Bill < ApplicationRecord
  enum bill_type: [:invoice_payable, :invoice_receivable, :expense_payable]
  enum type_invoice: [:bill_safe, :digit]

  validates :bill_type, :company_id, :invoice, :type_invoice, :issuance_date, :invoice_value, :increase, presence: true
  validates :salesman_id, :commission, presence: true, if: :invoice_receivable?
  validates :scanning_date, :description, :account_plan_id, :cost_center_id, :discount, :net_value, presence: true, if: :invoice_receivable? || :expense_payable?

  def invoice_receivable?
    bill_type == :invoice_receivable
  end

  def invoice_payable?
    bill_type == :invoice_payable
  end

  def expense_payable?
    bill_type == :expense_payable
  end
end
