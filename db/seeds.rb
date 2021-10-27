# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create!([{ name: "Google" }, { name: "Amazon" }])

Participant.create(name: "Fulano", person_type: :salesman)
Participant.create(name: "Beltrano", person_type: :client)
Participant.create(name: "Deltrano", person_type: :company)

ChartsAccount.create([{ description: "account 1" }, { description: "account 2" }])

CostCenter.create([{ description: "Cost CEnter 1" }, { description: "Cost CEnter 1" }])

AccountBank.create(description: "Conta Banco do Brasil")
AccountBank.create(description: "Conta Caixa Federal")

TypeCharge.create([{ description: "Carteira Simples" }, { description: "Carteira Registrada" }])

Bill.create!(bill_type: :invoice_receivable, company: Company.first, invoice: "fatura a receber",
             type_invoice: :bill_safe, issuance_date: Date.today, invoice_value: 150.99,
             increase: 0, net_value: 150.99, salesman: Participant.first, commission: 10)

Bill.create!(bill_type: :invoice_payable, company: Company.second, invoice: "fatura a pagar",
             type_invoice: :bill_safe, issuance_date: Date.today, invoice_value: 290.99,
             increase: 0, scanning_date: Date.today, description: "Nada", charts_account_id: 1,
             cost_center_id: 2, discount: 0, net_value: 290.99)

Bill.create!(bill_type: :expense_payable, company: Company.second, invoice: "despesas a pagar",
             type_invoice: :bill_safe, issuance_date: Date.today, invoice_value: 190.99,
             increase: 10.00, scanning_date: Date.today, description: "Nada", charts_account_id: 2,
             cost_center_id: 2, discount: 5.00, net_value: 195.99)

DocumentType.create([
                      { description: "Pix" }, { description: "Dinheiro" },
                      { description: "Cartão de Crédito" }, { description: "Cheque" }
                    ])
