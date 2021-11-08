class RenameAccountPlanToChartAccount < ActiveRecord::Migration[6.1]
  def change
    rename_table :account_plans, :chart_accounts

    # Bill
    rename_column :bills, :account_plan_id, :chart_accounts_id

    # Rateio
    rename_column :rateios, :account_plan_id, :chart_accounts_id
  end
end
