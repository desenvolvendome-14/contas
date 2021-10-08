class RemoveFieldsFromBill < ActiveRecord::Migration[6.1]
  def change
    remove_column :bills, :company_id, :integer
    remove_column :bills, :salesman_id, :integer
    remove_column :bills, :account_plan_id, :integer
    remove_column :bills, :cost_center_id, :integer
    remove_column :bills, :participant_id, :integer
  end
end
