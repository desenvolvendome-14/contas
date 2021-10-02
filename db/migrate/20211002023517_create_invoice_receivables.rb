class CreateInvoiceReceivables < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_receivables do |t|
      t.date :payment_date
      t.date :accounting_date
      t.decimal :amount_paid
      t.decimal :discount_amount
      t.decimal :interest_amount
      t.decimal :addition_amount
      t.decimal :total_amount
      t.string :notary_expenses
      t.string :protest_expenses
      t.decimal :amount_paid_chart_of_accounts
      t.decimal :discount_chart_of_accounts
      t.string :interest_chart_of_account
      t.string :addition_chart_of_accounts
      t.string :plan_of_accounts_expenses_notary_public
      t.string :plan_of_accounts_expenditures_protest
      t.string :history

      t.timestamps
    end
  end
end
