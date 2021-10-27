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

  validates :amount_paid, numericality: { greater_than_or_equal_to: 0 }
  validates :discount_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :interest_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :increase_amount, numericality: { greater_than_or_equal_to: 0 }

  before_save :calculate_total_amount

  private

  def calculate_total_amount
    self.total_amount = amount_paid - discount_amount + interest_amount + increase_amount
  end
end
