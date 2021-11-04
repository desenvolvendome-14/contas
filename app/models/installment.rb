class Installment < ApplicationRecord
  belongs_to :bill
  belongs_to :account_bank
  belongs_to :type_charge


	validates :bill, :account_bank, :type_charge, :due_date, presence: true
  validate :verify_date
	validate :positive_value
	validate :verify_discount, if: :receivable?
	validate :verify_protest_date, if: :receivable?
	validate :verify_notary_value, if: :receivable?
	validate :verify_send_date, if: :receivable?
	
  def receivable?
		bill.present? && bill.invoice_receivable?
	end

	def verify_date
		if due_date.nil? || Date.today > due_date
			errors.add(:due_date, :verify_date, message: "data vencimento não pode ser maior que data atual")
		end
	end
	def verify_send_date
		if send_date.nil? || Date.today > send_date
			errors.add(:send_date, :verify_send_date, message: "data de envio não pode ser maior que data atual")
		end
	end
	def verify_protest_date
		if protest_date.nil? || Date.today > protest_date
			errors.add(:protest_date, :protest_date, message: "data do protesto não pode ser maior que data atual")
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

	def verify_notary_value
		if notary_value < 0
			errors.add(:notary_value, :verify_notary_value, message: "Valor do Cartório não pode ser menor que zero") 
		end
	end

end
