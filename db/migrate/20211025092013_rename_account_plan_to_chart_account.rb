class RenameAccountPlanToChartAccount < ActiveRecord::Migration[6.1]
  def change
    rename_table :account_plans, :charts_accounts

    # Bill
    rename_column :bills, :account_plan_id, :charts_account_id

    # Rateio
    rename_column :rateios, :account_plan_id, :charts_account_id
  end
end
