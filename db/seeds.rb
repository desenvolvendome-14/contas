# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bill.create!(bill_type: :invoice_receivable, company_id: 1, invoice: "fatura a receber", type_invoice: :bill_safe,
             issuance_date: Date.today, invoice_value: 150.99, increase: 0, salesman_id: 1, commission: 10)

Bill.create!(bill_type: :invoice_payable, company_id: 2, invoice: "fatura a pagar", type_invoice: :bill_safe,
             issuance_date: Date.today, invoice_value: 290.99, increase: 0, scanning_date: Date.today,
             description: "Nada", account_plan_id: 1, cost_center_id: 2, discount: 0, net_value: 0)

Bill.create!(bill_type: :expense_payable, company_id: 2, invoice: "despesas a pagar", type_invoice: :bill_safe,
             issuance_date: Date.today, invoice_value: 190.99, increase: 0, scanning_date: Date.today,
             description: "Nada", account_plan_id: 1, cost_center_id: 2, discount: 0, net_value: 0)

AccountBank.create(description: "Conta Banco do Brasil")
AccountBank.create(description: "Conta Caixa Federal")

TypeCharge.create(description: "Dinheiro")
TypeCharge.create(description: "Pix")
