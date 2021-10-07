class Bill < ApplicationRecord
  belongs_to :company
  belongs_to :participant, optional: true
  belongs_to :salesman, class_name: 'Participant', optional: true
  belongs_to :account_plan, optional: true
  belongs_to :cost_center, optional: true

  enum bill_type: [:invoice_receivable, :invoice_payable, :expense_payable]
  enum type_invoice: [:bill_safe, :digit]

  validates :bill_type, :company, :invoice, :type_invoice, :issuance_date, :invoice_value, :increase, :net_value, presence: true

  validates :salesman_id, :commission, presence: true, if: :invoice_receivable?
  validates :scanning_date, :description, :account_plan_id, :cost_center_id, :discount, presence: true, if: proc { invoice_payable? || expense_payable? }

  def invoice_receivable?
    bill_type == "invoice_receivable"
  end

  def invoice_payable?
    bill_type == "invoice_payable"
  end

  def expense_payable?
    bill_type == "expense_payable"
  end
end
