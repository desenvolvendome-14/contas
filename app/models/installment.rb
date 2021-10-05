class Installment < ApplicationRecord
  belongs_to :bill
  belongs_to :account_bank
  belongs_to :type_charge
end
