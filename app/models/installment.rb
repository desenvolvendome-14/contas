class Installment < ApplicationRecord
  belongs_to :bill
  belongs_to :account_bank
  belongs_to :type_charge


	validates :bill, :account_bank, :type_charge, :due_date, presence: true
  validate :verify_date
	validate :positive_value
	validate :verify_discount, if: :receivable?
	
  def receivable?
		self.bill.invoice_receivable?
		
	end

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
	def  verify_discount
		if discount.nil? || discount < 0
			errors.add(:discount, :verify_discount, message: "Valor do Desconto não pode ser menor que zero")  
		end
	end

end
