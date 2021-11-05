class AddFieldsToPayment < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :notary_value, :float
    add_column :payments, :protest_value, :float
    add_reference :payments, :charts_accounts_notary_value,
                  references: :charts_accounts,
                  foreign_key: { to_table: :charts_accounts }, index: true
    add_reference :payments, :charts_accounts_protest_value,
                  references: :charts_accounts,
                  foreign_key: { to_table: :charts_accounts }, index: true
  end
end
