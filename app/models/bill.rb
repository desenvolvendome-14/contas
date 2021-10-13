# == Schema Information
#
# Table name: bills
#
#  id              :bigint           not null, primary key
#  bill_type       :integer
#  commission      :float
#  description     :string
#  discount        :float
#  increase        :float
#  invoice         :string
#  invoice_value   :float
#  issuance_date   :date
#  net_value       :float
#  scanning_date   :date
#  type_invoice    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_plan_id :integer
#  company_id      :integer
#  cost_center_id  :integer
#  participant_id  :integer
#  salesman_id     :integer
#
class Bill < ApplicationRecord
  belongs_to :company
  belongs_to :participant, optional: true
  belongs_to :salesman, class_name: 'Participant', optional: true
  belongs_to :account_plan, optional: true
  belongs_to :cost_center, optional: true

  has_many :rateios

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
