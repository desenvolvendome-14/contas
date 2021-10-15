class Installment < ApplicationRecord
  belongs_to :bill
  belongs_to :account_bank
  belongs_to :type_charge


	validates :bill, :account_bank, :type_charge, :due_date, presence: true
  validate :verify_date
	validate :positive_value
	
	def verify_date
		if due_date.nil? || Date.today > due_date
			errors.add(:due_date, :verify_date, message: "data vencimento não pode ser maior que data atual")
		end
	end

	def positive_value
		if value.nil? || value <= 0
			errors.add(:value, :positive_value, message: "Valor não pode ser menor ou igual a zero") 
		end
	end

end
