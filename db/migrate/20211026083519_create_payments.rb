class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.date :pay_date
      t.date :accounting_date
      t.float :amount_paid
      t.float :discount_amount
      t.float :interest_amount
      t.float :increase_amount
      t.float :total_amount
      t.references :bill, null: false, foreign_key: true
      t.references :installment, null: false, foreign_key: true
      t.references :reason_bearish, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true
      t.references :account_bank, null: false, foreign_key: true
      t.references :charts_accounts_amount_paid, null: false, references: :charts_accounts,
                                                 foreign_key: { to_table: :charts_accounts }, index: true
      t.references :charts_accounts_discount_amount, null: false, references: :charts_accounts,
                                                     foreign_key: { to_table: :charts_accounts }, index: true
      t.references :charts_accounts_interest_amount, null: false, references: :charts_accounts,
                                                     foreign_key: { to_table: :charts_accounts }, index: true
      t.references :charts_accounts_increase_amount, null: false, references: :charts_accounts,
                                                     foreign_key: { to_table: :charts_accounts }, index: true

      t.timestamps
    end
  end
end
