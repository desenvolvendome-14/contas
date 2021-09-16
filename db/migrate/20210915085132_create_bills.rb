class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.integer :bill_type
      t.integer :company_id
      t.integer :participant_id
      t.integer :type_invoice
      t.string :invoice
      t.float :commission
      t.date :issuance_date
      t.date :scanning_date
      t.string :description
      t.integer :account_plan_id
      t.integer :cost_center_id
      t.float :invoice_value
      t.float :increase
      t.float :discount
      t.float :net_value
      t.integer :salesman_id

      t.timestamps
    end
  end
end
