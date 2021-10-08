class AddFieldsToBill < ActiveRecord::Migration[6.1]
  def change
    add_column :bills, :salesman_id, :integer, index: true
    add_reference :bills, :company, null: false, foreign_key: true
    add_reference :bills, :account_plan,  foreign_key: true
    add_reference :bills, :cost_center,  foreign_key: true
    add_reference :bills, :participant,  foreign_key: true
    add_foreign_key :bills, :participants, column: :salesman_id
  end
end
