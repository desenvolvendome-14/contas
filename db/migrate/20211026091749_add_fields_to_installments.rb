class AddFieldsToInstallments < ActiveRecord::Migration[6.1]
  def change
    add_column :installments, :discount_due_date, :date
    add_column :installments, :discount, :float
    add_column :installments, :notary_title, :string
    add_column :installments, :send_date, :date
    add_column :installments, :notary_value, :float
    add_column :installments, :protested_title, :string
    add_column :installments, :protest_date, :date
    add_column :installments, :protest_value, :float
    add_column :installments, :bank_remittance, :string
  end
end
