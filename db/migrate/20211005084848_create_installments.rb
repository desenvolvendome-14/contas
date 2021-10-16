class CreateInstallments < ActiveRecord::Migration[6.1]
  def change
    create_table :installments do |t|
      t.string :name
      t.date :due_date
      t.float :value
      t.string :note
      t.references :bill, null: false, foreign_key: true
      t.references :account_bank, null: false, foreign_key: true
      t.references :type_charge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
